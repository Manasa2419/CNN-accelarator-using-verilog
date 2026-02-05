module CNN_Accelerator #(parameter DATA_WIDTH = 8) (
    input clk,
    input rst,
    input [DATA_WIDTH-1:0] input1,
    input [DATA_WIDTH-1:0] input2,
    input [DATA_WIDTH-1:0] input3,
    input [DATA_WIDTH-1:0] input4,
    input [DATA_WIDTH-1:0] weight,
    output [DATA_WIDTH-1:0] final_output
);
    wire [15:0] conv_output;
    wire [DATA_WIDTH-1:0] pooled_output;
    wire [DATA_WIDTH-1:0] activated_output;
    
    Convolution conv (.clk(clk), .rst(rst), .input_feature(input1), .weight(weight), .output_feature(conv_output));
    MaxPooling pool (.clk(clk), .rst(rst), .input1(input1), .input2(input2), .input3(input3), .input4(input4), .output_feature(pooled_output));
    LeakyReLU activation (.clk(clk), .rst(rst), .input_feature(pooled_output), .output_feature(activated_output));
    
    assign final_output = activated_output;
endmodule
