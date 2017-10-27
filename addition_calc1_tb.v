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
