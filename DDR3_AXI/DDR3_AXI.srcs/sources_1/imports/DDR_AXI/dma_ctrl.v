module dma_ctrl (
    //-----时钟复位
    input   wire            ui_clk          ,
    input   wire            ui_rst_n        ,
    //-----写FIFO的写端口   
    input   wire            wf_wr_clk       ,
    (* MARK_DEBUG="true" *)input   wire            wf_wr_en        ,
    (* MARK_DEBUG="true" *)input   wire    [15:0]  wf_wr_data      ,
    //-----读FIFO的读端口   
    input   wire            rf_rd_clk       ,
    // input   wire            rf_rd_en        ,
    (* MARK_DEBUG="true" *)output  wire    [15:0]  rf_rd_data      ,
    //-----mig的用户端口
    //写地址通道
    (* MARK_DEBUG="true" *)output  wire    [3:0]	s_axi_awid      ,   //写地址主机 ID 号，当只有一个从机一个主机时，该信号为 0 即可     
    (* MARK_DEBUG="true" *)output  reg     [27:0]	s_axi_awaddr    ,   //写地址通道地址     
    (* MARK_DEBUG="true" *)output  wire    [7:0]	s_axi_awlen     ,   //突发长度 len + 1 
    (* MARK_DEBUG="true" *)output  wire    [2:0]	s_axi_awsize    ,   //突发大小     
    (* MARK_DEBUG="true" *)output  wire    [1:0]	s_axi_awburst   ,   //突发类型：固定、递增、回绕。     
    (* MARK_DEBUG="true" *)output  reg      		s_axi_awvalid   ,   //地址的有效信号，主机发出          
    (* MARK_DEBUG="true" *)input   wire     		s_axi_awready   ,   //从机发出 
    output  wire    [0:0]	s_axi_awlock    ,   //总线锁信号,从没使用过，信号一般默认为 0；    
    output  wire    [3:0]	s_axi_awcache   ,   //缓存模式：一般使用的是无缓存模式，一般默认 4’b0;         
    output  wire    [2:0]	s_axi_awprot    ,   //没用，全给 0     
    output  wire    [3:0]	s_axi_awqos     ,   //没用，全给 0 
    //写数据通道
    (* MARK_DEBUG="true" *)output  wire    [127:0]	s_axi_wdata     ,   //写数据信号
    (* MARK_DEBUG="true" *)output  wire    [15:0]	s_axi_wstrb     ,   //字节有效信号，1 为有效
    (* MARK_DEBUG="true" *)output  reg 			s_axi_wlast     ,   //最后一个数据有效信号
    (* MARK_DEBUG="true" *)output  reg 			s_axi_wvalid    ,   //数据有效信号    
    (* MARK_DEBUG="true" *)input   wire			s_axi_wready    ,   //从机发出    
    //写响应通道
    (* MARK_DEBUG="true" *)input   wire    [3:0]	s_axi_bid       ,   //从机发出 ,和 awid 匹配    
    (* MARK_DEBUG="true" *)input   wire    [1:0]	s_axi_bresp     ,   //写响应操作信号，指明数据状态，从机发出，返回 2‘b0 表示成功响应
    (* MARK_DEBUG="true" *)input   wire			s_axi_bvalid    ,   //从机发出，表示响应有效
    (* MARK_DEBUG="true" *)output  wire			s_axi_bready    ,   //主机发出，一般直接拉高
    //读地址通道
    (* MARK_DEBUG="true" *)output  wire    [3:0]	s_axi_arid      ,   //读地址主机 ID 号，当只有一个从机一个主机时，该信号为 0 即可          
    (* MARK_DEBUG="true" *)output  reg     [27:0]	s_axi_araddr    ,   //读地址通道地址              
    (* MARK_DEBUG="true" *)output  wire    [7:0]	s_axi_arlen     ,   //突发长度          
    (* MARK_DEBUG="true" *)output  wire    [2:0]	s_axi_arsize    ,   //突发大小       
    (* MARK_DEBUG="true" *)output  wire    [1:0]	s_axi_arburst   ,   //突发类型       
    (* MARK_DEBUG="true" *)output  reg 			s_axi_arvalid   ,   //地址的有效信号，主机发出       
    (* MARK_DEBUG="true" *)input   wire			s_axi_arready   ,   //从机发出     
    output  wire    [0:0]	s_axi_arlock    ,   //总线锁信号,从没使用过，信号一般默认为 0；        
    output  wire    [3:0]	s_axi_arcache   ,   //缓存模式：一般使用的是无缓存模式，一般默认 4’b0;       
    output  wire    [2:0]	s_axi_arprot    ,   //没用，全给 0       
    output  wire    [3:0]	s_axi_arqos     ,   //没用，全给 0   
    //读数据通道
    (* MARK_DEBUG="true" *)input   wire    [3:0]	s_axi_rid       ,   //和 arid 匹配，从机发出
    (* MARK_DEBUG="true" *)input   wire    [127:0]	s_axi_rdata     ,   //读数据信号，从机发出
    (* MARK_DEBUG="true" *)input   wire    [1:0]	s_axi_rresp     ,   //读数据响应信号，从机发出
    (* MARK_DEBUG="true" *)input   wire			s_axi_rlast     ,   //最后一个数据有效信号，从机发出
    (* MARK_DEBUG="true" *)input   wire			s_axi_rvalid    ,   //读数据有效信号，从机发出   
    (* MARK_DEBUG="true" *)output  wire			s_axi_rready        //主机发出  
);

parameter AXI_LEN = 7;  //突发长度 = len + 1
parameter ADDR_MAX = 2048   ;

localparam IDLE     = 6'b00_0001;   //空闲
localparam WR_ADDR  = 6'b00_0010;   //写地址状态
localparam WR_DATA  = 6'b00_0100;   //写数据状态
localparam WR_VALID = 6'b00_1000;   //写响应状态
localparam RD_ADDR  = 6'b01_0000;   //读地址状态
localparam RD_DATA  = 6'b10_0000;   //读数据状态

(* MARK_DEBUG="true" *)reg [5:0] c_state,n_state;


(* MARK_DEBUG="true" *)wire [7 : 0] wf_data_cnt    ;   //写FIFO的数据个数（128bit  读时钟域）
(* MARK_DEBUG="true" *)wire [7 : 0] rf_data_cnt    ;   //读FIFO的数据个数（128bit  写时钟域）

(* MARK_DEBUG="true" *)reg [8:0] wr_data_cnt;  //写数据个数计数器

(* MARK_DEBUG="true" *)wire wf_rd_en;  //写FIFO的读使能
(* MARK_DEBUG="true" *)wire rf_wr_en;  //读FIFO的写使能

assign wf_rd_en = s_axi_wvalid && s_axi_wready;
assign rf_wr_en = s_axi_rvalid && s_axi_rready;

//----写地址通道
assign s_axi_awid       = 4'd0      ;   //
assign s_axi_awlen      = AXI_LEN   ;   //
assign s_axi_awsize     = 3'b100    ;   //16
assign s_axi_awburst    = 2'b01     ;   //递增

assign s_axi_awlock     = 0         ;
assign s_axi_awcache    = 0         ;
assign s_axi_awprot     = 0         ;
assign s_axi_awqos      = 0         ;

//----写数据通道
assign s_axi_wstrb      = 16'hffff  ;

//----写响应通道
assign s_axi_bready     = 1         ;

//----读地址通道
assign s_axi_arid       = 4'd0      ;
assign s_axi_arlen      = AXI_LEN   ;
assign s_axi_arsize     = 3'b100    ;
assign s_axi_arburst    = 2'b01     ;

assign s_axi_arlock     = 0         ;
assign s_axi_arcache    = 0         ;
assign s_axi_arprot     = 0         ;
assign s_axi_arqos      = 0         ;
//----读数据通道
assign s_axi_rready     = 1         ;


//模拟读FIFO的读使能
(* MARK_DEBUG="true" *)reg rf_rd_en;
always @(posedge ui_clk ) begin
    if(!ui_rst_n)
        rf_rd_en <= 0;
    else if(rf_data_cnt > 6)
        rf_rd_en <= 1;
    else
        rf_rd_en <= rf_rd_en;
end


always @(posedge ui_clk ) begin
    if(!ui_rst_n)
        c_state <= IDLE;
    else
        c_state <= n_state;
end

always @(*) begin
    if(!ui_rst_n)
        n_state = IDLE;
    else begin
        case (c_state)
            IDLE    : begin
                if(wf_data_cnt > AXI_LEN)
                    n_state = WR_ADDR;
                else if(rf_data_cnt < AXI_LEN)  //可以加一个防止读空的条件 如：flag
                    n_state = RD_ADDR;
                else
                    n_state = IDLE;
            end
            WR_ADDR : begin
                if(s_axi_awvalid && s_axi_awready)
                    n_state = WR_DATA;
                else
                    n_state = WR_ADDR;
            end
            WR_DATA : begin
                if(s_axi_wlast && s_axi_wvalid && s_axi_wready)
                    n_state = WR_VALID;
                else
                    n_state = WR_DATA;
            end
            WR_VALID: begin
                if(s_axi_bresp == 2'b00 && s_axi_bvalid && s_axi_bready)
                    n_state = IDLE;
                else
                    n_state = WR_VALID;
            end
            RD_ADDR : begin
                if(s_axi_arvalid && s_axi_arready)
                    n_state = RD_DATA;
                else
                    n_state = RD_ADDR;
            end
            RD_DATA : begin
                if(s_axi_rlast && s_axi_rvalid && s_axi_rready)
                    n_state = IDLE;
                else
                    n_state = RD_DATA;
            end
            default: n_state = IDLE;
        endcase
    end
end

//写地址的有效信号
always @(posedge ui_clk ) begin
    if(!ui_rst_n)
        s_axi_awvalid <= 0;
    else if(c_state == WR_ADDR && s_axi_awvalid && s_axi_awready)
        s_axi_awvalid <= 0;
    else if(c_state == WR_ADDR)
        s_axi_awvalid <= 1;
    else
        s_axi_awvalid <= s_axi_awvalid; 
end

//写地址
always @(posedge ui_clk ) begin
    if(!ui_rst_n)
        s_axi_awaddr <= 0;
    else if(s_axi_awaddr == ADDR_MAX - 128 && s_axi_awvalid && s_axi_awready)
        s_axi_awaddr <= 0;
    else if(s_axi_awvalid && s_axi_awready)
        s_axi_awaddr <= s_axi_awaddr + 128;
    else
        s_axi_awaddr <= s_axi_awaddr;
end

//写数据的最后一个字节有效信号
always @(posedge ui_clk ) begin
    if(!ui_rst_n)
        s_axi_wlast <= 0;
    else if(wr_data_cnt == AXI_LEN && s_axi_wvalid && s_axi_wready)
        s_axi_wlast <= 0;
    else if(wr_data_cnt == AXI_LEN - 1 && s_axi_wvalid && s_axi_wready)
        s_axi_wlast <= 1;
    else
        s_axi_wlast <= s_axi_wlast;
end

//写数据有效信号
always @(posedge ui_clk ) begin
    if(!ui_rst_n)
        s_axi_wvalid <= 0;
    else if(s_axi_wlast && s_axi_wvalid && s_axi_wready)
        s_axi_wvalid <= 0;
    else if(c_state == WR_DATA)
        s_axi_wvalid <= 1;
    else
        s_axi_wvalid <= s_axi_wvalid; 
end

//读地址的有效信号
always @(posedge ui_clk ) begin
    if(!ui_rst_n)
        s_axi_arvalid <= 0;
    else if(c_state == RD_ADDR && s_axi_arvalid && s_axi_arready)
        s_axi_arvalid <= 0;
    else if(c_state == RD_ADDR)
        s_axi_arvalid <= 1;
    else
        s_axi_arvalid <= s_axi_arvalid;
end

//读地址
always @(posedge ui_clk ) begin
    if(!ui_rst_n)
        s_axi_araddr <= 0;
    else if(s_axi_araddr == ADDR_MAX - 128 && s_axi_arvalid && s_axi_wready)
        s_axi_araddr <= 0;
    else if(s_axi_arvalid && s_axi_wready)
        s_axi_araddr <= s_axi_araddr + 128;
    else
        s_axi_araddr <= s_axi_araddr;
end

//写数据个数计数器
always @(posedge ui_clk ) begin
    if(!ui_rst_n)
        wr_data_cnt <= 0;
    else if(wr_data_cnt == AXI_LEN && s_axi_wvalid && s_axi_wready)
        wr_data_cnt <= 0;
    else if(c_state == WR_DATA && s_axi_wvalid && s_axi_wready)
        wr_data_cnt <= wr_data_cnt + 1;
    else
        wr_data_cnt <= wr_data_cnt;
end


wr_fifo wr_fifo_u (
  .wr_clk(wf_wr_clk),                // input wire wr_clk
  .rd_clk(ui_clk),                // input wire rd_clk
  .din(wf_wr_data),                      // input wire [15 : 0] din
  .wr_en(wf_wr_en),                  // input wire wr_en
  .rd_en(wf_rd_en),                  // input wire rd_en
  .dout(s_axi_wdata),                    // output wire [127 : 0] dout
//   .full(full),                    // output wire full
//   .empty(empty),                  // output wire empty
  .rd_data_count(wf_data_cnt)  // output wire [7 : 0] rd_data_count
);

rd_fifo rd_fifo_u (
  .wr_clk(ui_clk),                // input wire wr_clk
  .rd_clk(rf_rd_clk),                // input wire rd_clk
  .din(s_axi_rdata),                      // input wire [127 : 0] din
  .wr_en(rf_wr_en),                  // input wire wr_en
  .rd_en(rf_rd_en),                  // input wire rd_en
  .dout(rf_rd_data),                    // output wire [15 : 0] dout
//   .full(full),                    // output wire full
//   .empty(empty),                  // output wire empty
  .wr_data_count(rf_data_cnt)  // output wire [7 : 0] wr_data_count
);
    
endmodule