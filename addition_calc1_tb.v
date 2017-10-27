  $display("SEPERATE FILE Testing addition on each bit");

  x = 1;

  repeat(31) begin : add

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

      #200

      rd_data1_out = out_data1;

      if(rd_data1_out != x) begin
        $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", rd_data1_out, x);
        end

      if(rd_data1_out == x) begin
        $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data1_out, x);
        end

      x=(x<<1);
    end : add
