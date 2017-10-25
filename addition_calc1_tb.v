module addition_calc1_tb (//cmd_in, data_in, clk, data_out);

wire [0:31] data_out,
reg [0:31] data_in,
reg 	         c_clk,
reg [0:3] cmd_in);

integer x;
integer rd_data_out;

initial begin

  $display("Testing addition on each bit");

  x = 1;

  repeat(31) begin : add

      #200

      cmd_in = 1;
      data_in = x;

      #200

      cmd_in = 0;
      data_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;

      #10

      rd_data_out = data_out;

      if(rd_data_out != x) begin
        $display("ANSWER WAS NOT CORRECT, out data was %d when answer should be %d\n", rd_data_out, x);
        end

      if(rd_data_out == x) begin
        $display("ANSWER WAS CORRECT, out data was %d and answer is %d\n", rd_data_out, x);
        end

      x=(x<<1);
    end : add
end
endmodule
