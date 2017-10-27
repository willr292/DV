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

//  `include "invalidcommand_calc1_tb.v"
  `include "subtraction_calc1_tb.v"
//  `include "rightshift_calc1_tb.v"
//  `include "leftshift_calc1_tb.v"
//  `include "addition_calc1_tb.v"

  #2000 $stop;

     end // initial begin

endmodule // example_calc1_tb
