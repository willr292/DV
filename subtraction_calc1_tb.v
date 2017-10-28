//SUBTRACTION TESTS

// TEST 1: underflow error on port 1
$display("Checking for underflow error correct report on port 1\n",);
      #400

      req1_cmd_in = 2;
req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
req2_cmd_in = 0;
req2_data_in = 0;
req3_cmd_in = 0;
req3_data_in = 0;
req4_cmd_in = 0;
req4_data_in = 0;

#200

req1_cmd_in = 0;
req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_1111;

#200

rd_data1_out = out_data1;
rd_resp1_out = out_resp1;
$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp1_out, rd_data1_out);

// TEST 2: underflow error on port 2
$display("Checking for underflow error correct report on port 2\n",);
      #400

      req1_cmd_in = 0;
req1_data_in = 0;
req2_cmd_in = 2;
req2_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
req3_cmd_in = 0;
req3_data_in = 0;
req4_cmd_in = 0;
req4_data_in = 0;

#200

req2_cmd_in = 0;
req2_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_1111;

#200

rd_data2_out = out_data2;
rd_resp2_out = out_resp2;
$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp2_out, rd_data2_out);

// TEST 3: underflow error on port 3
$display("Checking for underflow error correct report on port 3\n",);
      #400

      req1_cmd_in = 0;
req1_data_in = 0;
req2_cmd_in = 0;
req2_data_in = 0;
req3_cmd_in = 2;
req3_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
req4_cmd_in = 0;
req4_data_in = 0;

#200

req3_cmd_in = 0;
req3_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_1111;

#200

rd_data3_out = out_data3;
rd_resp3_out = out_resp3;
$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp3_out, rd_data3_out);

// TEST 4: underflow error on port 4
$display("Checking for underflow error correct report on port 4\n",);
      #400

      req1_cmd_in = 0;
req1_data_in = 0;
req2_cmd_in = 0;
req2_data_in = 0;
req3_cmd_in = 0;
req3_data_in = 0;
req4_cmd_in = 2;
req4_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

#200

req4_cmd_in = 0;
req4_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_1111;

#200

rd_data4_out = out_data4;
rd_resp4_out = out_resp4;
$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp4_out, rd_data4_out);

//TEST 5: Subtraction for each bit port 1.
$display("Testing subtraction on each bit port 1.");

x = 1;

repeat(31) begin

    #200

    req1_cmd_in = 2;
    req1_data_in = x;
    req2_cmd_in = 0;
    req2_data_in = 0;
    req3_cmd_in = 0;
    req3_data_in = 0;
    req4_cmd_in = 0;
    req4_data_in = 0;

    #200

    req1_cmd_in = 0;
    req1_data_in = x;

    #200

    rd_data1_out = out_data1;

    if(rd_data1_out != 0) begin
      $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be 0\n", rd_data1_out);
      end

    x=(x<<1);
  end

//TEST 6: Subtraction for each bit port 2.
$display("Testing subtraction on each bit port 2.");

x = 1;

repeat(31) begin

    #200

    req1_cmd_in = 0;
    req1_data_in = 0;
    req2_cmd_in = 2;
    req2_data_in = x;
    req3_cmd_in = 0;
    req3_data_in = 0;
    req4_cmd_in = 0;
    req4_data_in = 0;

    #200

    req2_cmd_in = 0;
    req2_data_in = x;

    #200

    rd_data2_out = out_data2;

    if(rd_data2_out != 0) begin
      $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be 0\n", rd_data2_out);
      end

    x=(x<<1);
  end

//TEST 7: Subtraction for each bit port 3.
$display("Testing subtraction on each bit port 3.");

x = 1;

repeat(31) begin

    #200

    req1_cmd_in = 0;
    req1_data_in = 0;
    req2_cmd_in = 0;
    req2_data_in = 0;
    req3_cmd_in = 2;
    req3_data_in = x;
    req4_cmd_in = 0;
    req4_data_in = 0;

    #200

    req3_cmd_in = 0;
    req3_data_in = x;

    #200

    rd_data3_out = out_data3;

    if(rd_data3_out != 0) begin
      $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be 0\n", rd_data3_out);
      end

    x=(x<<1);
  end

//TEST 8: Subtraction for each bit port 4.
$display("Testing subtraction on each bit port 4.");

x = 1;

repeat(31) begin

    #200

    req1_cmd_in = 0;
    req1_data_in = 0;
    req2_cmd_in = 0;
    req2_data_in = 0;
    req3_cmd_in = 0;
    req3_data_in = 0;
    req4_cmd_in = 2;
    req4_data_in = x;

    #200

    req4_cmd_in = 0;
    req4_data_in = x;

    #200

    rd_data4_out = out_data4;

    if(rd_data4_out != 0) begin
      $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be 0\n", rd_data4_out);
      end

    x=(x<<1);
  end
