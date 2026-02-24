module data_gen (
    input   wire            clk         ,
    input   wire            rst_n       ,
    input   wire            ddr_init    ,
    output  reg             wf_wr_en    ,
    output  reg     [15:0]  wf_wr_data
);


always @(posedge clk ) begin
    if(!rst_n)
        wf_wr_en <= 0;
    else if(ddr_init)
        wf_wr_en <= 1;
    else
        wf_wr_en <= wf_wr_en;
end


always @(posedge clk ) begin
    if(!rst_n)
        wf_wr_data <= 0;
    else if(wf_wr_data == 1023)
        wf_wr_data <= 0;
    else if(wf_wr_en)
        wf_wr_data <= wf_wr_data + 1;
    else
        wf_wr_data <= wf_wr_data;
end
    
endmodule