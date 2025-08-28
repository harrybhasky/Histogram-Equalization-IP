module cdfCalc #(parameter DataWidth = 8,outWidth = $clog2(640*480) ,compareVal=0) (
input i_clk,
input   i_reset_n,
input [DataWidth-1:0] i_pixel,
input i_pixel_valid,
output reg [outWidth-1:0] o_frequency
);

always @ (posedge i_clk)
begin
if (!i_reset_n)
frequency <= 0;
else if(i_ pixel_valid)
begin
if (i_pixel <= compareVal)
o_frequency<= o_frequency+1;
end
end
endmodule