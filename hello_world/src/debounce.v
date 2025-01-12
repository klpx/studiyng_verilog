module debounce(
    input in, output out,
    input clk
);
parameter wait_cnt = 27000 * 5; // 5 ms for 27 mhz

reg out_state;
reg [31:0] slow_clk;

assign out = out_state;

initial begin
    slow_clk <= 0;
end

always@(posedge clk)
begin
    slow_clk <= slow_clk >= wait_cnt ? 0 : slow_clk + 1;
end

always@(posedge slow_clk)
begin
    out_state <= in;
end

endmodule
