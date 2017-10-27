wire [0:31]   out_data1, out_data2, out_data3, out_data4;
wire [0:1]    out_resp1, out_resp2, out_resp3, out_resp4;

reg 	         c_clk;
reg [0:3] 	 req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
reg [0:31]    req1_data_in, req2_data_in, req3_data_in, req4_data_in;
reg [1:7] 	 reset;

calc1 DUV(out_data1, out_data2, out_data3, out_data4, out_resp1, out_resp2, out_resp3, out_resp4, c_clk, req1_cmd_in, req1_data_in, req2_cmd_in, req2_data_in, req3_cmd_in, req3_data_in, req4_cmd_in, req4_data_in, reset);

integer x;
integer y;
integer z;
integer a;

integer rd_data1_out;
integer rd_resp1_out;
integer rd_data2_out;
integer rd_resp2_out;
integer rd_data3_out;
integer rd_resp3_out;
integer rd_data4_out;
integer rd_resp4_out;
