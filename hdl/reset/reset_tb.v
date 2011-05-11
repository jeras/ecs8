`timescale 1ns / 1ps

module reset_tb;

// local signals
reg  clk_i;
reg  clk_o;
reg  rst_n_i;
wire rst_n_o;

// request for a dumpfile
initial begin
  $dumpfile("reset.vcd");
  $dumpvars(0, reset_tb);
end

//  input clock generation
initial     clk_i = 1'b1;
always #(5) clk_i = ~clk_i;

// output clock generation
initial     clk_o = 1'b1;
always #(5) clk_o = ~clk_o;

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
  .clk_i    (clk_i),
  .clk_o    (clk_o),
  .rst_n_i  (rst_n_i),
  .rst_n_o  (rst_n_o)
);

endmodule
