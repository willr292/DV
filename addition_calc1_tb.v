//ADDITION TESTS

//Test 1 Addition for each bit port1.
$display("Testing addition on each bit port 1.");

x = 1;

repeat(31) begin

    #200

    req1_cmd_in = 1;
    req1_data_in = x;
    req2_cmd_in = 0;
    req2_data_in = 0;
    req3_cmd_in = 0;
    req3_data_in = 0;
    req4_cmd_in = 0;
    req4_data_in = 0;

    #200

    req1_cmd_in = 0;
    req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

    #10

    rd_data1_out = out_data1;

    if(rd_data1_out != x) begin
      $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", rd_data1_out, x);
      end
      /*
    if(rd_data1_out == x) begin
      $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data1_out, x);
      end
      */
    x=(x<<1);
  end

  //Test 2 Addition for each bit port2.
  $display("Testing addition on each bit port 2.");

  x = 1;

  repeat(31) begin

      #200

      req1_cmd_in = 0;
      req1_data_in = 0;
      req2_cmd_in = 1;
      req2_data_in = x;
      req3_cmd_in = 0;
      req3_data_in = 0;
      req4_cmd_in = 0;
      req4_data_in = 0;

      #200

      req2_cmd_in = 0;
      req2_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

      #10

      rd_data2_out = out_data2;

      if(rd_data2_out != x) begin
        $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", rd_data2_out, x);
        end
        /*
      if(rd_data2_out == x) begin
        $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data2_out, x);
        end
        */

      x=(x<<1);
    end

    //Test 3 Addition for each bit port3.
    $display("Testing addition on each bit port 3.");

    x = 1;

    repeat(31) begin

        #200

        req1_cmd_in = 0;
        req1_data_in = 0;
        req2_cmd_in = 0;
        req2_data_in = 0;
        req3_cmd_in = 1;
        req3_data_in = x;
        req4_cmd_in = 0;
        req4_data_in = 0;

        #200

        req3_cmd_in = 0;
        req3_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

        #10

        rd_data3_out = out_data3;

        if(rd_data3_out != x) begin
          $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", rd_data3_out, x);
          end
          /*
        if(rd_data3_out == x) begin
          $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data3_out, x);
          end
          */

        x=(x<<1);
      end

      //Test 4 Addition for each bit port4.
      $display("Testing addition on each bit port 4.");

      x = 1;

      repeat(31) begin

          #200

          req1_cmd_in = 0;
          req1_data_in = 0;
          req2_cmd_in = 0;
          req2_data_in = 0;
          req3_cmd_in = 0;
          req3_data_in = 0;
          req4_cmd_in = 1;
          req4_data_in = x;

          #200

          req4_cmd_in = 0;
          req4_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

          #10

          rd_data4_out = out_data4;

          if(rd_data4_out != x) begin
            $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", rd_data4_out, x);
            end
            /*
          if(rd_data4_out == x) begin
            $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data4_out, x);
            end
            */

          x=(x<<1);
        end

        // TEST 5: Overflow error on port 1
      	$display("Test for overflow error on port 1, adding 1 to max\n");
      	#400

      		req1_cmd_in = 1;
      	req1_data_in = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
      	req2_cmd_in = 0;
      	req2_data_in = 0;
      	req3_cmd_in = 0;
      	req3_data_in = 0;
      	req4_cmd_in = 0;
      	req4_data_in = 0;

      	#200

      	req1_cmd_in = 0;
      	req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

      	#10
      	rd_data1_out = out_data1;
      	rd_resp1_out = out_resp1;
        if (rd_data1_out != 2 || rd_data1_out != 0) begin
          $display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp1_out, rd_data1_out);
          end

        // TEST 6: Overflow error on port 2
      	$display("Test for overflow error on port 2, adding 1 to max\n");
      	#400

      		req1_cmd_in = 0;
      	req1_data_in = 0;
      	req2_cmd_in = 1;
      	req2_data_in = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
      	req3_cmd_in = 0;
      	req3_data_in = 0;
      	req4_cmd_in = 0;
      	req4_data_in = 0;

      	#200

      	req2_cmd_in = 0;
      	req2_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

      	#10
      	rd_data2_out = out_data2;
      	rd_resp2_out = out_resp2;
        if (rd_data2_out != 2 || rd_data2_out != 0) begin
          $display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp2_out, rd_data2_out);
          end

        // TEST 7: Overflow error on port 3
        $display("Test for overflow error on port 3, adding 1 to max\n");
        #400

          req1_cmd_in = 0;
        req1_data_in = 0;
        req2_cmd_in = 0;
        req2_data_in = 0;
        req3_cmd_in = 1;
        req3_data_in = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
        req4_cmd_in = 0;
        req4_data_in = 0;

        #200

        req3_cmd_in = 0;
        req3_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

        #10
        rd_data3_out = out_data3;
        rd_resp3_out = out_resp3;
        if (rd_data3_out != 2 || rd_data3_out != 0) begin
          $display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp3_out, rd_data3_out);
          end

        // TEST 8: Overflow error on port 4
        $display("Test for overflow error on port 4, adding 1 to max\n");
        #400

          req1_cmd_in = 0;
        req1_data_in = 0;
        req2_cmd_in = 0;
        req2_data_in = 0;
        req3_cmd_in = 0;
        req3_data_in = 0;
        req4_cmd_in = 1;
        req4_data_in = 32'b1111_1111_1111_1111_1111_1111_1111_1111;

        #200

        req4_cmd_in = 0;
        req4_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

        #10
        rd_data4_out = out_data4;
        rd_resp4_out = out_resp4;
        if (rd_data4_out != 2 || rd_data4_out != 0) begin
          $display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp4_out, rd_data4_out);
          end
