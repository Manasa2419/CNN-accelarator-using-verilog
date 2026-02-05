module convolver #(
    parameter N = 16,  // Bit width
    parameter Q = 12,  // Fractional bits
    parameter n = 416, // YOLOv3 input size
    parameter k = 3,   // Kernel size
    parameter s = 1,   // Stride
    parameter NUM_MAC = 8 // Increase MAC units for Darknet19
)(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [N-1:0] activation_in,
    input wire [(k*k*N)-1:0] weight, 
    input wire [N-1:0] batch_gamma, // Gamma for batch normalization
    input wire [N-1:0] batch_beta,  // Beta for batch normalization
    output reg [N-1:0] conv_out,  
    output reg valid_out,    
    output reg done          
);

    // Declare line buffer for storing past inputs
    reg [N-1:0] line_buffer [(k-1)*n-1:0];

    // Declare window buffer explicitly
    wire [N-1:0] window_buffer [0:k*k-1];

    // Line buffer shift register logic: Stores previous (k-1) rows
    integer i;
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < (k-1)*n; i = i + 1) begin
                line_buffer[i] <= 0;
            end
        end else if (en) begin
            // Shift values down
            for (i = (k-1)*n-1; i > 0; i = i - 1) begin
                line_buffer[i] <= line_buffer[i-1];
            end
            line_buffer[0] <= activation_in; // Insert new pixel value at the top
        end
    end

    // Assign values to `window_buffer` for convolution
    genvar x, y;
    generate
        for (y = 0; y < k; y = y + 1) begin : window_row
            for (x = 0; x < k; x = x + 1) begin : window_col
                if (y == k-1) begin
                    assign window_buffer[y*k + x] = line_buffer[x];  
                end else begin
                    assign window_buffer[y*k + x] = line_buffer[y*n + x];
                end
            end
        end
    endgenerate

    // Convolution computation using window buffer
    reg [N-1:0] conv_temp;
    always @(*) begin
        conv_temp = 0;
        for (i = 0; i < k*k; i = i + 1) begin
            conv_temp = conv_temp + (($signed(window_buffer[i]) * $signed(weight[i*N +: N])) >>> Q);
        end
    end

    // Batch normalization: X_bn = (X - mean) / variance * gamma + beta
    wire [N-1:0] bn_out;
    assign bn_out = (conv_temp * batch_gamma) + batch_beta;

    // Leaky ReLU: X if X > 0 else 0.1 * X
    assign conv_out = (bn_out[N-1]) ? (bn_out >>> 3) : bn_out; // (Divide by 8 for 0.125 approximation)

endmodule

