//RIGHT SHIFT TESTS

//Test 1 right shift by 1 bit on port 1
  #400
  rd_data1_out = 0;
  $display("Testing right shift by 1 bit on each bit on port 1");

  z = 32'b1000_0000_0000_0000_0000_0000_0000_0000;

  repeat(31) begin

      #200

      req1_cmd_in = 6;
      req1_data_in = z;
      req2_cmd_in = 0;
      req2_data_in = 0;
      req3_cmd_in = 0;
      req3_data_in = 0;
      req4_cmd_in = 0;
      req4_data_in = 0;

      #200

      req1_cmd_in = 0;
      req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

      #200

      rd_data1_out = out_data1;

      if(rd_data1_out != (z>>1)) begin
        $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data1_out), $unsigned(z>>1));
        end
        /*
      if(rd_data1_out == (z>>1)) begin
        $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data1_out, (z>>1));
        end
        */
      z=(z>>1);
    end

//Test 2 right shift by 1 bit on port 2
  #400
  rd_data2_out = 0;
  $display("Testing right shift by 1 bit on each bit on port 2");

  z = 32'b1000_0000_0000_0000_0000_0000_0000_0000;

  repeat(31) begin

      #200

      req1_cmd_in = 0;
      req1_data_in = 0;
      req2_cmd_in = 6;
      req2_data_in = z;
      req3_cmd_in = 0;
      req3_data_in = 0;
      req4_cmd_in = 0;
      req4_data_in = 0;

      #200

      req2_cmd_in = 0;
      req2_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

      #200

      rd_data2_out = out_data2;

      if(rd_data2_out != (z>>1)) begin
        $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data2_out), $unsigned(z>>1));
        end
        /*
      if(rd_data2_out == (z>>1)) begin
        $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data2_out, (z>>1));
        end
        */
      z=(z>>1);
    end

//Test 3 right shift by 1 bit on port 3
  #400
  rd_data3_out = 0;
  $display("Testing right shift by 1 bit on each bit on port 3");

  z = 32'b1000_0000_0000_0000_0000_0000_0000_0000;

  repeat(31) begin

      #200

      req1_cmd_in = 0;
      req1_data_in = 0;
      req2_cmd_in = 0;
      req2_data_in = 0;
      req3_cmd_in = 6;
      req3_data_in = z;
      req4_cmd_in = 0;
      req4_data_in = 0;

      #200

      req3_cmd_in = 0;
      req3_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

      #200

      rd_data3_out = out_data3;

      if(rd_data3_out != (z>>1)) begin
        $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data3_out), $unsigned(z>>1));
        end
        /*
      if(rd_data3_out == (z>>1)) begin
        $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data3_out, (z>>1));
        end
        */
      z=(z>>1);
    end

//Test 4 right shift by 1 bit on port 4
  #400
  rd_data4_out = 0;
  $display("Testing right shift by 1 bit on each bit on port 4");

  z = 32'b1000_0000_0000_0000_0000_0000_0000_0000;

  repeat(31) begin

      #200

      req1_cmd_in = 0;
      req1_data_in = 0;
      req2_cmd_in = 0;
      req2_data_in = 0;
      req3_cmd_in = 0;
      req3_data_in = 0;
      req4_cmd_in = 6;
      req4_data_in = z;

      #200

      req4_cmd_in = 0;
      req4_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

      #200

      rd_data4_out = out_data4;

      if(rd_data4_out != (z>>1)) begin
        $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data4_out), $unsigned(z>>1));
        end
        /*
      if(rd_data4_out == (z>>1)) begin
        $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data4_out, (z>>1));
        end
        */
      z=(z>>1);
    end
