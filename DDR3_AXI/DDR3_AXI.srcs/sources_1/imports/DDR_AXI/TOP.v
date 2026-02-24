module TOP (
    input   wire                clk          ,
    input   wire                rst_n        ,
    //ddr
    output  wire     [13:0]	    ddr3_addr    ,   
    output  wire     [2:0]		ddr3_ba      ,
    output  wire    			ddr3_cas_n   ,
    output  wire     [0:0]		ddr3_ck_n    ,
    output  wire     [0:0]		ddr3_ck_p    ,
    output  wire     [0:0]		ddr3_cke     ,           
    output  wire    			ddr3_ras_n   ,
    output  wire    			ddr3_reset_n ,   
    output  wire    			ddr3_we_n    ,   
    inout   wire    [15:0]		ddr3_dq      ,   
    inout   wire    [1:0]		ddr3_dqs_n   ,       
    inout   wire    [1:0]		ddr3_dqs_p   ,   
    output  wire     [0:0]		ddr3_cs_n    ,   
    output  wire     [1:0]		ddr3_dm      ,
    output  wire     [0:0]		ddr3_odt           
);


wire mig_clk;
wire locked ;
wire sys_rst_n  ;

assign sys_rst_n = rst_n & locked;

  clk_wiz_0 clk_wiz_0_u
   (
    // Clock out ports
    .mig_clk(mig_clk),     // output mig_clk
    // Status and control signals
    .resetn(rst_n), // input resetn
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk));      // input clk_in1


   wire            ddr_init  ;
   wire            wf_wr_en  ;
   wire    [15:0]  wf_wr_data;

data_gen data_gen_u(
    .clk       (clk       )  ,
    .rst_n     (sys_rst_n )  ,
    .ddr_init  (ddr_init  )  ,
    .wf_wr_en  (wf_wr_en  )  ,
    .wf_wr_data(wf_wr_data)
);

wire            ui_clk          ;
wire            ui_rst_n        ;

   wire    [15:0]  rf_rd_data      ;

//写地址通道
   wire    [3:0]	s_axi_awid      ;
   wire    [27:0]	s_axi_awaddr    ;
   wire    [7:0]	s_axi_awlen     ;
   wire    [2:0]	s_axi_awsize    ;
   wire    [1:0]	s_axi_awburst   ;
   wire     		s_axi_awvalid   ;
   wire     		s_axi_awready   ;
   wire    [0:0]	s_axi_awlock    ;
   wire    [3:0]	s_axi_awcache   ;
   wire    [2:0]	s_axi_awprot    ;
   wire    [3:0]	s_axi_awqos     ;

//写数据通道
   wire    [127:0]	s_axi_wdata     ;
   wire    [15:0]	s_axi_wstrb     ;
   wire			s_axi_wlast     ;
   wire			s_axi_wvalid    ;
   wire			s_axi_wready    ;

//写响应通道
   wire    [3:0]	s_axi_bid       ;
   wire    [1:0]	s_axi_bresp     ;
   wire			s_axi_bvalid    ;
   wire			s_axi_bready    ;

//读地址通道
   wire    [3:0]	s_axi_arid      ;
   wire    [27:0]	s_axi_araddr    ;
   wire    [7:0]	s_axi_arlen     ;
   wire    [2:0]	s_axi_arsize    ;
   wire    [1:0]	s_axi_arburst   ;
   wire			s_axi_arvalid   ;
   wire			s_axi_arready   ;
   wire    [0:0]	s_axi_arlock    ;
   wire    [3:0]	s_axi_arcache   ;
   wire    [2:0]	s_axi_arprot    ;
   wire    [3:0]	s_axi_arqos     ;

//读数据通道
   wire    [3:0]	s_axi_rid       ;
   wire    [127:0]	s_axi_rdata     ;
   wire    [1:0]	s_axi_rresp     ;
   wire			s_axi_rlast     ;
   wire			s_axi_rvalid    ;
   wire			s_axi_rready    ;


dma_ctrl dma_ctrl_u(
    //-----时钟复位
    .ui_clk          (ui_clk          ),
    .ui_rst_n        (~ui_rst_n        ),
    //-----写FIFO的写端口   
    .wf_wr_clk       (clk             ),
    .wf_wr_en        (wf_wr_en        ),
    .wf_wr_data      (wf_wr_data      ),
    //-----读FIFO的读端口   
    .rf_rd_clk       (clk             ),
    // .rf_rd_en        (rf_rd_en        ),
    .rf_rd_data      (rf_rd_data      ),
    //-----mig的用户端口
    //写地址通道
    .s_axi_awid      (s_axi_awid      ),   //写地址主机 ID 号，当只有一个从机一个主机时，该信号为 0 即可     
    .s_axi_awaddr    (s_axi_awaddr    ),   //写地址通道地址     
    .s_axi_awlen     (s_axi_awlen     ),   //突发长度 len + 1 
    .s_axi_awsize    (s_axi_awsize    ),   //突发大小     
    .s_axi_awburst   (s_axi_awburst   ),   //突发类型：固定、递增、回绕。     
    .s_axi_awvalid   (s_axi_awvalid   ),   //地址的有效信号，主机发出          
    .s_axi_awready   (s_axi_awready   ),   //从机发出 
    .s_axi_awlock    (s_axi_awlock    ),   //总线锁信号,从没使用过，信号一般默认为 0；    
    .s_axi_awcache   (s_axi_awcache   ),   //缓存模式：一般使用的是无缓存模式，一般默认 4’b0;         
    .s_axi_awprot    (s_axi_awprot    ),   //没用，全给 0     
    .s_axi_awqos     (s_axi_awqos     ),   //没用，全给 0 
    //写数据通道
    .s_axi_wdata     (s_axi_wdata     ),   //写数据信号
    .s_axi_wstrb     (s_axi_wstrb     ),   //字节有效信号，1 为有效
    .s_axi_wlast     (s_axi_wlast     ),   //最后一个数据有效信号
    .s_axi_wvalid    (s_axi_wvalid    ),   //数据有效信号    
    .s_axi_wready    (s_axi_wready    ),   //从机发出    
    //写响应通道
    .s_axi_bid       (s_axi_bid       ),   //从机发出 ,和 awid 匹配    
    .s_axi_bresp     (s_axi_bresp     ),   //写响应操作信号，指明数据状态，从机发出，返回 2‘b0 表示成功响应
    .s_axi_bvalid    (s_axi_bvalid    ),   //从机发出，表示响应有效
    .s_axi_bready    (s_axi_bready    ),   //主机发出，一般直接拉高
    //读地址通道
    .s_axi_arid      (s_axi_arid      ),   //读地址主机 ID 号，当只有一个从机一个主机时，该信号为 0 即可          
    .s_axi_araddr    (s_axi_araddr    ),   //读地址通道地址              
    .s_axi_arlen     (s_axi_arlen     ),   //突发长度          
    .s_axi_arsize    (s_axi_arsize    ),   //突发大小       
    .s_axi_arburst   (s_axi_arburst   ),   //突发类型       
    .s_axi_arvalid   (s_axi_arvalid   ),   //地址的有效信号，主机发出       
    .s_axi_arready   (s_axi_arready   ),   //从机发出     
    .s_axi_arlock    (s_axi_arlock    ),   //总线锁信号,从没使用过，信号一般默认为 0；        
    .s_axi_arcache   (s_axi_arcache   ),   //缓存模式：一般使用的是无缓存模式，一般默认 4’b0;       
    .s_axi_arprot    (s_axi_arprot    ),   //没用，全给 0       
    .s_axi_arqos     (s_axi_arqos     ),   //没用，全给 0   
    //读数据通道
    .s_axi_rid       (s_axi_rid       ),   //和 arid 匹配，从机发出
    .s_axi_rdata     (s_axi_rdata     ),   //读数据信号，从机发出
    .s_axi_rresp     (s_axi_rresp     ),   //读数据响应信号，从机发出
    .s_axi_rlast     (s_axi_rlast     ),   //最后一个数据有效信号，从机发出
    .s_axi_rvalid    (s_axi_rvalid    ),   //读数据有效信号，从机发出   
    .s_axi_rready    (s_axi_rready    )    //主机发出  
);

 mig_7series_0 u_mig_7series_0 (
    // Memory interface ports
    .ddr3_addr                      (ddr3_addr),            // output [13:0]	ddr3_addr
    .ddr3_ba                        (ddr3_ba),              // output [2:0]		ddr3_ba
    .ddr3_cas_n                     (ddr3_cas_n),           // output			ddr3_cas_n
    .ddr3_ck_n                      (ddr3_ck_n),            // output [0:0]		ddr3_ck_n
    .ddr3_ck_p                      (ddr3_ck_p),            // output [0:0]		ddr3_ck_p
    .ddr3_cke                       (ddr3_cke),             // output [0:0]		ddr3_cke
    .ddr3_ras_n                     (ddr3_ras_n),           // output			ddr3_ras_n
    .ddr3_reset_n                   (ddr3_reset_n),         // output			ddr3_reset_n
    .ddr3_we_n                      (ddr3_we_n),            // output			ddr3_we_n
    .ddr3_dq                        (ddr3_dq),              // inout [15:0]		ddr3_dq
    .ddr3_dqs_n                     (ddr3_dqs_n),           // inout [1:0]		ddr3_dqs_n
    .ddr3_dqs_p                     (ddr3_dqs_p),           // inout [1:0]		ddr3_dqs_p
    .init_calib_complete            (ddr_init           ),  // output			init_calib_complete
	.ddr3_cs_n                      (ddr3_cs_n),            // output [0:0]		ddr3_cs_n
    .ddr3_dm                        (ddr3_dm),              // output [1:0]		ddr3_dm
    .ddr3_odt                       (ddr3_odt),             // output [0:0]		ddr3_odt
    // Application interface ports
    .ui_clk                         (ui_clk),               // output			ui_clk
    .ui_clk_sync_rst                (ui_rst_n),      // output			ui_clk_sync_rst
    .mmcm_locked                    (   ),          // output			mmcm_locked
    .aresetn                        (sys_rst_n),              // input			aresetn
    .app_sr_req                     (0),           // input			app_sr_req
    .app_ref_req                    (0),          // input			app_ref_req
    .app_zq_req                     (0),           // input			app_zq_req
    .app_sr_active                  (),        // output			app_sr_active
    .app_ref_ack                    (),          // output			app_ref_ack
    .app_zq_ack                     (),           // output			app_zq_ack
    // Slave Interface Write Address Ports
    .s_axi_awid                     (s_axi_awid),           // input [3:0]		s_axi_awid
    .s_axi_awaddr                   (s_axi_awaddr),         // input [27:0]		s_axi_awaddr
    .s_axi_awlen                    (s_axi_awlen),          // input [7:0]		s_axi_awlen
    .s_axi_awsize                   (s_axi_awsize),         // input [2:0]		s_axi_awsize
    .s_axi_awburst                  (s_axi_awburst),        // input [1:0]		s_axi_awburst
    .s_axi_awlock                   (s_axi_awlock),         // input [0:0]		s_axi_awlock
    .s_axi_awcache                  (s_axi_awcache),        // input [3:0]		s_axi_awcache
    .s_axi_awprot                   (s_axi_awprot),         // input [2:0]		s_axi_awprot
    .s_axi_awqos                    (s_axi_awqos),          // input [3:0]		s_axi_awqos
    .s_axi_awvalid                  (s_axi_awvalid),        // input			s_axi_awvalid
    .s_axi_awready                  (s_axi_awready),        // output			s_axi_awready
    // Slave Interface Write Data Ports
    .s_axi_wdata                    (s_axi_wdata),          // input [127:0]	s_axi_wdata
    .s_axi_wstrb                    (s_axi_wstrb),          // input [15:0]		s_axi_wstrb
    .s_axi_wlast                    (s_axi_wlast),          // input			s_axi_wlast
    .s_axi_wvalid                   (s_axi_wvalid),         // input			s_axi_wvalid
    .s_axi_wready                   (s_axi_wready),         // output			s_axi_wready
    // Slave Interface Write Response Ports
    .s_axi_bid                      (s_axi_bid),            // output [3:0]		s_axi_bid
    .s_axi_bresp                    (s_axi_bresp),          // output [1:0]		s_axi_bresp
    .s_axi_bvalid                   (s_axi_bvalid),         // output			s_axi_bvalid
    .s_axi_bready                   (s_axi_bready),         // input			s_axi_bready
    // Slave Interface Read Address Ports
    .s_axi_arid                     (s_axi_arid),           // input [3:0]		s_axi_arid
    .s_axi_araddr                   (s_axi_araddr),         // input [27:0]		s_axi_araddr
    .s_axi_arlen                    (s_axi_arlen),          // input [7:0]		s_axi_arlen
    .s_axi_arsize                   (s_axi_arsize),         // input [2:0]		s_axi_arsize
    .s_axi_arburst                  (s_axi_arburst),        // input [1:0]		s_axi_arburst
    .s_axi_arlock                   (s_axi_arlock),         // input [0:0]		s_axi_arlock
    .s_axi_arcache                  (s_axi_arcache),        // input [3:0]		s_axi_arcache
    .s_axi_arprot                   (s_axi_arprot),         // input [2:0]		s_axi_arprot
    .s_axi_arqos                    (s_axi_arqos),          // input [3:0]		s_axi_arqos
    .s_axi_arvalid                  (s_axi_arvalid),        // input			s_axi_arvalid
    .s_axi_arready                  (s_axi_arready),        // output			s_axi_arready
    // Slave Interface Read Data Ports
    .s_axi_rid                      (s_axi_rid),            // output [3:0]		s_axi_rid
    .s_axi_rdata                    (s_axi_rdata),          // output [127:0]	s_axi_rdata
    .s_axi_rresp                    (s_axi_rresp),          // output [1:0]		s_axi_rresp
    .s_axi_rlast                    (s_axi_rlast),          // output			s_axi_rlast
    .s_axi_rvalid                   (s_axi_rvalid),         // output			s_axi_rvalid
    .s_axi_rready                   (s_axi_rready),         // input			s_axi_rready
    // System Clock Ports
    .sys_clk_i                       (mig_clk),
    .sys_rst                        (sys_rst_n) // input sys_rst
    );
    
endmodule