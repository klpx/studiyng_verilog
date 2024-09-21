`include "counter.v"
module counter_tb();
reg clock, reset, enable;
wire [3:0] count;

initial begin 
    $display ("time\t clk reset enable count");	
  $monitor ("%g\t %b   %b     %b      %b", 
	  $time, clock, reset, enable, count);	
    $dumpvars(0, counter_tb);
    clock = 1;
    reset = 0;
    enable = 0;

    #5   reset = 1;
    #10  reset = 0;
    #10  enable = 1;
    #100 enable = 0;
    #10  reset = 1;
    #5 $finish;
end

always begin
    #5 clock = ~clock;
end

counter TEST_counter(
    clock,
    reset,
    enable,
    count
);

endmodule