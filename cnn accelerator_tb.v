module Testbench;
    reg clk;
    reg rst;
    reg [7:0] input1, input2, input3, input4;
    reg [7:0] weight;
    wire [7:0] final_output;
    
    CNN_Accelerator cnn(.clk(clk), .rst(rst), .input1(input1), .input2(input2), .input3(input3), .input4(input4), .weight(weight), .final_output(final_output));
    
    initial begin
        clk = 0;
        rst = 1;
        #5 rst = 0;
        input1 = 8'd5;
        input2 = 8'd6;
        input3 = 8'd7;
        input4 = 8'd8;
        weight = 8'd3;
        #10 $finish;
    end
    
    always #1 clk = ~clk;
endmodule
