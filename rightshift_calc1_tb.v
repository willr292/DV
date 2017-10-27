//RIGHT SHIFT TESTS

//Test 1 right shift by 1 bit on port 1
  #400
  rd_data1_out = 0;
  $display("Testing right shift by 1 bit on each bit on port 1");

  z = 32'b1000_0000_0000_0000_0000_0000_0000_0000;

  repeat(30) begin

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

      rd_data2_out = out_data2;

      if(rd_data1_out != (z>>1)) begin
        $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", rd_data2_out, (z>>1));
        end
        /*
      if(rd_data1_out == (z>>1)) begin
        $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data2_out, (z>>1));
        end
        */
      z=(z>>1);
    end
