module batch_norm #(parameter N = 16)(
    input wire [N-1:0] input_data, 
    input wire [N-1:0] gamma, 
    input wire [N-1:0] beta, 
    output wire [N-1:0] output_data
);
    assign output_data = (input_data * gamma) + beta;
endmodule

