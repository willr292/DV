`uselib lib=calc1_black_box

module example_calc1_tb;

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

	integer rd_data1_out;
	integer rd_resp1_out;
  integer rd_data2_out;
	integer rd_resp2_out;
  integer rd_data3_out;
	integer rd_resp3_out;
  integer rd_data4_out;
	integer rd_resp4_out;

   initial
     begin
	c_clk = 0;
	req1_cmd_in = 0;
	req1_data_in = 0;
	req2_cmd_in = 0;
	req2_data_in = 0;
	req3_cmd_in = 0;
	req3_data_in = 0;
	req4_data_in = 0;
     end

   always #100 c_clk = ~c_clk;

  // `include "addition_calc1_tb.v"

   initial
     begin

        // First drive reset. Driving bit 1 is enough to reset the design.

	reset[1] = 1;
	#800
	reset[1] = 0;

	// TEST 1: 1h + 1FF_FFFFh = 200_0000 ?

        #400

        req1_cmd_in = 1;
	req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
	req2_cmd_in = 0;
	req2_data_in = 0;
	req3_cmd_in = 0;
	req3_data_in = 0;
	req4_cmd_in = 0;
	req4_data_in = 0;

	#200

	req1_cmd_in = 0;
	req1_data_in = 32'b0001_1111_1111_1111_1111_1111_1111_1111;

	// TEST 2: 1FF_FFFFh + 1FF_FFFFh =  3FFF_FFFE ?

        #400

        req1_cmd_in = 1;
	req1_data_in = 32'h1FFF_FFFF;
	req2_cmd_in = 0;
	req2_data_in = 0;
	req3_cmd_in = 0;
	req3_data_in = 0;
	req4_cmd_in = 0;
	req4_data_in = 0;

	#200

	req1_cmd_in = 0;
	req1_data_in = 32'h1FFF_FFFF;

	// TEST 3: 0+0=0 ?

	#400

        req1_cmd_in = 1;
	req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	req2_cmd_in = 0;
	req2_data_in = 0;
	req3_cmd_in = 0;
	req3_data_in = 0;
	req4_cmd_in = 0;
	req4_data_in = 0;

	#200

	req1_cmd_in = 0;
	req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

	// TEST 4: Overflow error
	$display("Test for overflow error, adding 1 to max\n");
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
	$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp1_out, rd_data1_out);

	// TEST 6: Invalid command 3
	$display("Testing for invalid command 3\n",);

	#400

		req1_cmd_in = 3;
	req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
	req2_cmd_in = 0;
	req2_data_in = 0;
	req3_cmd_in = 0;
	req3_data_in = 0;
	req4_cmd_in = 0;
	req4_data_in = 0;

	#10
	rd_data1_out = out_data1;
	rd_resp1_out = out_resp1;
	$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp1_out, rd_data1_out);

	// TEST 7: Invalid command 4
	$display("Testing for invalid command 4\n",);

	#400

		req1_cmd_in = 4;
	req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
	req2_cmd_in = 0;
	req2_data_in = 0;
	req3_cmd_in = 0;
	req3_data_in = 0;
	req4_cmd_in = 0;
	req4_data_in = 0;

	#10
	rd_data1_out = out_data1;
	rd_resp1_out = out_resp1;
	$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp1_out, rd_data1_out);

  //TEST 8: 0 no command with random numbers

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

  #10

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

	// TEST 8: underflow error
	$display("Checking for underflow error correct report\n",);
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

	#10

	rd_data1_out = out_data1;
	rd_resp1_out = out_resp1;
	$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp1_out, rd_data1_out);

	// TEST 9 Addition for each bit

	#400

	$display("Testing addition on each bit");

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

			#10

			rd_data1_out = out_data1;

			if(rd_data1_out != x) begin
				$display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", rd_data1_out, x);
				end

			if(rd_data1_out == x) begin
				$display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data1_out, x);
				end

			x=(x<<1);
		end : add

// TEST 10 Left Shift for each bit.

	#400

	$display("Testing left shift on each bit");

	y = 1;

	repeat(30) begin : leftshift

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
				$display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", rd_data1_out, (y<<1));
				end

			if(rd_data1_out == (y<<1)) begin
				$display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data1_out, (y<<1));
				end

			y=(y<<1);
		end : leftshift

    // TEST 10 Right Shift for each bit.

    	#400
      rd_data1_out = 0;
    	$display("Testing right shift on each bit");

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

    			#100

    			rd_data1_out = out_data1;

    			if(rd_data1_out != (z>>1)) begin
    				$display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", rd_data1_out, (z>>1));
    				end

    			if(rd_data1_out == (z>>1)) begin
    				$display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data1_out, (z>>1));
    				end

    			z=(z>>1);
    		end

    //addition_calc1_tb port1(.cmd_in(req1_cmd_in), .data_in(req1_data_in), .data_out(out_data1),.clk(c_clk));

	#2000 $stop;



     end // initial begin
     	/*
   always
     @ (reset or req1_cmd_in or req1_data_in or req2_cmd_in or req2_data_in or req3_cmd_in or req3_data_in or req4_cmd_in or req4_data_in) begin

	$display ("%t: r:%b \n 1c:%d,1d:%d \n 2c:%d,2d:%d \n 3c:%d,3d:%d \n 4c:%d,4d:%d \n 1r:%d,1d:%d \n 2r:%d,2d:%d \n 3r:%d,3d:%d \n 4r:%d,4d:%d \n\n", $time, reset[1], req1_cmd_in, req1_data_in, req2_cmd_in, req2_data_in, req3_cmd_in, req3_data_in, req4_cmd_in, req4_data_in, out_resp1, out_data1, out_resp2, out_data2, out_resp3, out_data3, out_resp4, out_data4);

     end
	*/
endmodule // example_calc1_tb
