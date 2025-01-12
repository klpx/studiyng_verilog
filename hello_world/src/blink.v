module blink(
    input clock, input rst,
    output led
);
reg[1:0] mode;
reg[31:0] counter;
reg r_led;
wire trig;

debounce #(27000 * 5) rst_debnc(rst, trig, clock);

initial begin
    mode <= 0;
    counter <= 0;
    r_led <= 1;
end

assign led = r_led;

always@(negedge trig)
begin
    mode <= mode + 1;
end

always@(posedge clock)
begin
    if (mode == 0) begin
        counter <= counter + 1;
    end else if (mode == 1) begin
        counter <= counter + 2;
    end else if (mode == 2) begin
        counter <= counter + 4;
    end else begin
        counter <= counter + 8;
    end
    if (counter > 27000000)
    begin
        r_led <= !r_led;
        counter <= 0;
    end
end

endmodule