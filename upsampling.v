module upsampling #(
    parameter N = 16,
    parameter SCALE = 2
)(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [N-1:0] data_in,
    output reg [N-1:0] data_out
);
    always @(posedge clk) begin
        if (rst)
            data_out <= 0;
        else if (en)
            data_out <= data_in; // Simply replicate values for nearest-neighbor upsampling
    end
endmodule

