module LeakyReLU #(parameter DATA_WIDTH = 8, parameter LEAKY_SLOPE = 2) (
    input clk,
    input rst,
    input signed [DATA_WIDTH-1:0] input_feature,
    output reg signed [DATA_WIDTH-1:0] output_feature
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            output_feature <= 0;
        else
            output_feature <= (input_feature >= 0) ? input_feature : (input_feature / LEAKY_SLOPE);
    end
endmodule
