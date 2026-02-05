module Convolution #(parameter KERNEL_SIZE = 3, parameter DATA_WIDTH = 8) (
    input clk,
    input rst,
    input [DATA_WIDTH-1:0] input_feature,
    input [DATA_WIDTH-1:0] weight,
    output reg [DATA_WIDTH*2-1:0] output_feature
);
    
    integer i;
    reg [DATA_WIDTH-1:0] input_buffer [0:KERNEL_SIZE*KERNEL_SIZE-1];
    reg [DATA_WIDTH-1:0] weight_buffer [0:KERNEL_SIZE*KERNEL_SIZE-1];
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            output_feature <= 0;
        else begin
            output_feature = 0;
            for (i = 0; i < KERNEL_SIZE*KERNEL_SIZE; i = i + 1) begin
                output_feature = output_feature + input_buffer[i] * weight_buffer[i];
            end
        end
    end
endmodule
