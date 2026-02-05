module bounding_box #(
    parameter N = 16
)(
    input wire [N-1:0] tx, ty, tw, th, 
    input wire [N-1:0] anchor_w, anchor_h, // Predefined anchor box sizes
    input wire [N-1:0] cx, cy, // Cell grid coordinates
    output wire [N-1:0] bx, by, bw, bh
);
    assign bx = tx + cx;
    assign by = ty + cy;
    assign bw = (tw * anchor_w) >>> 10; // Approximate exp() using shift
    assign bh = (th * anchor_h) >>> 10;
endmodule

