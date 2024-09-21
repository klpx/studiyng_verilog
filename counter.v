module counter(
    clock, reset, enable, count
);
input clock; wire clock;
input reset; wire reset;
input enable; wire enable;
output [3:0] count; reg [3:0] count;


always @ (posedge clock)
begin
    if (reset == 1) begin
        count = 0;
    end else begin
        count = count + enable;
    end
end

endmodule; 
