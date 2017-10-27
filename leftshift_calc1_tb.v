//LEFT SHIFT TESTS

// TEST 1 Left Shift 1 bit for each bit on port 1.

	#400

	$display("Testing left shift on each bit port 1");

	y = 1;

	repeat(31) begin

			#200

			req1_cmd_in = 5;
			req1_data_in = y;
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

			if(rd_data1_out != (y<<1)) begin
				$display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data1_out), $unsigned(y<<1));
				end
        /*
			if(rd_data1_out == (y<<1)) begin
				$display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", $unsigned(rd_data1_out), $unsigned(y<<1));
				end
        */
			y=(y<<1);
		end

// TEST 2 Left Shift 1 bit for each bit on port 2.

	#400

	$display("Testing left shift on each bit port 2");

	y = 1;

	repeat(31) begin

			#200

			req1_cmd_in = 0;
			req1_data_in = 0;
			req2_cmd_in = 5;
			req2_data_in = y;
			req3_cmd_in = 0;
			req3_data_in = 0;
			req4_cmd_in = 0;
			req4_data_in = 0;

			#200

			req2_cmd_in = 0;
			req2_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

			#10

			rd_data2_out = out_data2;

			if(rd_data2_out != (y<<1)) begin
				$display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data2_out), $unsigned(y<<1));
				end
        /*
			if(rd_data2_out == (y<<1)) begin
				$display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", $unsigned(rd_data2_out), $unsigned(y<<1));
				end
        */
			y=(y<<1);
		end

// TEST 3 Left Shift 1 bit for each bit on port 3.

  #400

  $display("Testing left shift on each bit port 3");

  y = 1;

  repeat(31) begin

      #200

      req1_cmd_in = 0;
      req1_data_in = 0;
      req2_cmd_in = 0;
      req2_data_in = 0;
      req3_cmd_in = 5;
      req3_data_in = y;
      req4_cmd_in = 0;
      req4_data_in = 0;

      #200

      req3_cmd_in = 0;
      req3_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

      #10

      rd_data3_out = out_data3;

      if(rd_data3_out != (y<<1)) begin
        $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data3_out), $unsigned(y<<1));
        end
        /*
      if(rd_data3_out == (y<<1)) begin
        $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", $unsigned(rd_data3_out), $unsigned(y<<1));
        end
        */
      y=(y<<1);
    end

// TEST 4 Left Shift 1 bit for each bit on port 4.

  #400

  $display("Testing left shift on each bit port 4");

  y = 1;

  repeat(31) begin

      #200

      req1_cmd_in = 0;
      req1_data_in = 0;
      req2_cmd_in = 0;
      req2_data_in = 0;
      req3_cmd_in = 0;
      req3_data_in = 0;
      req4_cmd_in = 5;
      req4_data_in = y;

      #200

      req4_cmd_in = 0;
      req4_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;

      #10

      rd_data4_out = out_data4;

      if(rd_data4_out != (y<<1)) begin
        $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data4_out), $unsigned(y<<1));
        end
        /*
      if(rd_data4_out == (y<<1)) begin
        $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", $unsigned(rd_data4_out), $unsigned(y<<1));
        end
        */
      y=(y<<1);
    end


//Test 5 left shift by increasing amount
  $display("Testing left shift by increasing amount port 1");

  a = 1;

  repeat(31) begin

  req1_cmd_in = 5;
  req1_data_in = 1;
  req2_cmd_in = 0;
  req2_data_in = 0;
  req3_cmd_in = 0;
  req3_data_in = 0;
  req4_cmd_in = 0;
  req4_data_in = 0;

  #200

  req1_cmd_in = 0;
  req1_data_in = a;

  #10

  rd_data1_out = out_data1;

  if(rd_data1_out != (1<<a)) begin
    $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data1_out), (1<<a));
    end
		/*
  if(rd_data1_out == (1<<a)) begin
    $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", $unsigned(rd_data1_out), (1<<a));
    end
		*/
  a=a+1;
end

//Test 5 left shift by increasing amount
  $display("Testing left shift by increasing amount port 2");

  a = 1;

  repeat(31) begin

  req1_cmd_in = 0;
  req1_data_in = 0;
  req2_cmd_in = 5;
  req2_data_in = 1;
  req3_cmd_in = 0;
  req3_data_in = 0;
  req4_cmd_in = 0;
  req4_data_in = 0;

  #200

  req2_cmd_in = 0;
  req2_data_in = a;

  #10

  rd_data2_out = out_data2;

  if(rd_data2_out != (1<<a)) begin
    $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data2_out), (1<<a));
    end
		/*
  if(rd_data1_out == (1<<a)) begin
    $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", $unsigned(rd_data1_out), (1<<a));
    end
		*/
  a=a+1;
end

//Test 5 left shift by increasing amount
  $display("Testing left shift by increasing amount port 3");

  a = 1;

  repeat(31) begin

  req1_cmd_in = 0;
  req1_data_in = 0;
  req2_cmd_in = 0;
  req2_data_in = 0;
  req3_cmd_in = 5;
  req3_data_in = 1;
  req4_cmd_in = 0;
  req4_data_in = 0;

  #200

  req3_cmd_in = 0;
  req3_data_in = a;

  #10

  rd_data3_out = out_data3;

  if(rd_data3_out != (1<<a)) begin
    $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data3_out), (1<<a));
    end
		/*
  if(rd_data1_out == (1<<a)) begin
    $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", $unsigned(rd_data1_out), (1<<a));
    end
		*/
  a=a+1;
end

//Test 5 left shift by increasing amount
  $display("Testing left shift by increasing amount port 4");

  a = 1;

  repeat(31) begin

  req1_cmd_in = 0;
  req1_data_in = 0;
  req2_cmd_in = 0;
  req2_data_in = 0;
  req3_cmd_in = 0;
  req3_data_in = 0;
  req4_cmd_in = 5;
  req4_data_in = 1;

  #200

  req4_cmd_in = 0;
  req4_data_in = a;

  #10

  rd_data4_out = out_data4;

  if(rd_data4_out != (1<<a)) begin
    $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", $unsigned(rd_data4_out), (1<<a));
    end
		/*
  if(rd_data1_out == (1<<a)) begin
    $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", $unsigned(rd_data1_out), (1<<a));
    end
		*/
  a=a+1;
end
