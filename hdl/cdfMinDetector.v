module cdfMinDetector #(parameter DataWidth=8, outWidth=$clog2(640*480))(
    input i_clk,
    input [DataWidth-1:0] i_pixel,
    input i_pixel_valid,
    input i_reset_n,
    output reg [outWidth-1:0] cdfMin

);

reg [DataWidth-1:0] currentIndex;

always @(posedge i_clk)
begin
    if(!i_reset_n)
    begin
            cdfMin<= 0;
            currentIndex <= 2**DataWidth-1; // 255 for 8 bits
    end
    else if
    begin
        if(currentIndex == i_pixel)
        cdfMin = cdfMin +1;
        else if(i_pixel<currentIndex)
        begin
            cdfMin <= 1;
            currentIndex <= i_pixel;
        end
    end
end
endmodule
