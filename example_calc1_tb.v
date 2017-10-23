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

	#200

	$display("Output response is: %b\n and data out is %b\n", out_resp1, out_data1);


	// TEST 5:
	/*
	#400

	for(x=0, x<20, x++) {

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

	}
	*/


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

	#200

	$display("Output response is: %d\n", out_resp1);

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

	#200

	$display("Output response is: %d\n", out_resp1);

	// TEST 8: underflow error

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

	#800

	$display("Output response is: %d, and answer is %d\n", out_resp1, out_data1);

	// TEST 9 
	#400
	for(x=1; x<(5); x=x+1) begin
		
			#400
			req1_cmd_in = 1;
			req1_data_in = x;
			req2_cmd_in = 0;
			req2_data_in = 0;
			req3_cmd_in = 0;
			req3_data_in = 0;
			req4_cmd_in = 0;
			req4_data_in = 0;
			#600
			req1_cmd_in = 0;
			req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

			#400

			if(out_data1 != x) begin
				$display("ANSWER WAS NOT CORRECT, out data was %b when answer should be %b", out_data1, x);
				end
		end
	/*
	//TEST 10 
	#400
	for (x=0; x<4294967295; x=x+1) begin
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
		req1_data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
	end
*/
	#2000 $stop;



     end // initial begin

   always
     @ (reset or req1_cmd_in or req1_data_in or req2_cmd_in or req2_data_in or req3_cmd_in or req3_data_in or req4_cmd_in or req4_data_in) begin
	
	$display ("%t: r:%b \n 1c:%d,1d:%d \n 2c:%d,2d:%d \n 3c:%d,3d:%d \n 4c:%d,4d:%d \n 1r:%d,1d:%d \n 2r:%d,2d:%d \n 3r:%d,3d:%d \n 4r:%d,4d:%d \n\n", $time, reset[1], req1_cmd_in, req1_data_in, req2_cmd_in, req2_data_in, req3_cmd_in, req3_data_in, req4_cmd_in, req4_data_in, out_resp1, out_data1, out_resp2, out_data2, out_resp3, out_data3, out_resp4, out_data4);
	
     end

endmodule // example_calc1_tb


   
