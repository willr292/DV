//INVALID COMMAND TESTS

// TEST 1: Invalid command 3
$display("Testing for invalid command 3 port 1\n",);

#400

  req1_cmd_in = 3;
req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
req2_cmd_in = 0;
req2_data_in = 0;
req3_cmd_in = 0;
req3_data_in = 0;
req4_cmd_in = 0;
req4_data_in = 0;

#200
rd_data1_out = out_data1;
rd_resp1_out = out_resp1;
$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp1_out, rd_data1_out);

// TEST 2: Invalid command 4
$display("Testing for invalid command 4 port 1\n",);

#400

  req1_cmd_in = 4;
req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
req2_cmd_in = 0;
req2_data_in = 0;
req3_cmd_in = 0;
req3_data_in = 0;
req4_cmd_in = 0;
req4_data_in = 0;

#200
rd_data1_out = out_data1;
rd_resp1_out = out_resp1;
$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp1_out, rd_data1_out);

//TEST 3: 0 no command with random numbers

$display("Testing output is 0 on all channels with 0 command.\n");

#400

  req1_cmd_in = 0;
req1_data_in = $random;
req2_cmd_in = 0;
req2_data_in = $random;
req3_cmd_in = 0;
req3_data_in = $random;
req4_cmd_in = 0;
req4_data_in = $random;

#200

req1_cmd_in = 0;
req1_data_in = $random;
req2_cmd_in = 0;
req2_data_in = $random;
req3_cmd_in = 0;
req3_data_in = $random;
req4_cmd_in = 0;
req4_data_in = $random;

#200

rd_data1_out = out_data1;
rd_resp1_out = out_resp1;
rd_data2_out = out_data2;
rd_resp2_out = out_resp2;
rd_data3_out = out_data3;
rd_resp3_out = out_resp3;
rd_data4_out = out_data4;
rd_resp4_out = out_resp4;
$display("port1 data = %d and resp is %d\n port2 data = %d and resp is %d\n port3 data = %d and resp is %d\n port1 data = %d and resp is %d\n",
rd_data1_out,
rd_resp1_out,
rd_data2_out,
rd_resp2_out,
rd_data3_out,
rd_resp3_out,
rd_data4_out,
rd_resp4_out);
