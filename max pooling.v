module MaxPooling #(parameter DATA_WIDTH = 8) (
    input clk,
    input rst,
    input [DATA_WIDTH-1:0] input1,
    input [DATA_WIDTH-1:0] input2,
    input [DATA_WIDTH-1:0] input3,
    input [DATA_WIDTH-1:0] input4,
    output reg [DATA_WIDTH-1:0] output_feature
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            output_feature <= 0;
        else
            output_feature <= (input1 > input2) ? 
                              ((input1 > input3) ? 
                               ((input1 > input4) ? input1 : input4) : 
                               ((input3 > input4) ? input3 : input4)) :
                              ((input2 > input3) ? 
                               ((input2 > input4) ? input2 : input4) : 
                               ((input3 > input4) ? input3 : input4));
    end
endmodule
