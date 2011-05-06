`timescale 1ns / 1ps

module reset_tb;

// local signals
reg  clk;
reg  rst_n_i;
wire rst_n_o;

// request for a dumpfile
initial begin
  $dumpfile("reset.vcd");
  $dumpvars(0, reset_tb);
end

// clock generation
initial     clk = 1'b1;
always #(5) clk = ~clk;

// reset source generation
initial begin
  rst_n_i = 1'b0;
  #202;
  rst_n_i = 1'b1;
  #202;
  rst_n_i = 1'b0;
  #12;
  rst_n_i = 1'b1;
  #202;
  $finish();
end

// test module instance
reset #(
  .LN       (5)
) reset (
  .clk      (clk),
  .rst_n_i  (rst_n_i),
  .rst_n_o  (rst_n_o)
);

endmodule
