`uselib lib=calc1_black_box

module example_calc1_tb;

`include "declerations_calc1_tb.v"

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

	#200

	rd_data1_out = out_data1;
	rd_resp1_out = out_resp1;
	$display("Output response should be 2 and is: %d, and answer should be 0 and is %d\n", rd_resp1_out, rd_data1_out);``
        `include "rightshift_calc1_tb.v"
        `include "leftshift_calc1_tb.v"
        `include "addition_calc1_tb.v"

	#2000 $stop;



     end // initial begin

endmodule // example_calc1_tb
