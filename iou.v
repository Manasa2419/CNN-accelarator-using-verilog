module iou_computation #(
    parameter N = 16
)(
    input wire [N-1:0] x1, y1, w1, h1, // First box
    input wire [N-1:0] x2, y2, w2, h2, // Second box
    output reg [N-1:0] iou
);
    reg [N-1:0] inter_x, inter_y, inter_w, inter_h, inter_area, union_area;
    always @(*) begin
        inter_x = (x1 > x2) ? x1 : x2;
        inter_y = (y1 > y2) ? y1 : y2;
        inter_w = ((x1 + w1) < (x2 + w2)) ? (x1 + w1 - inter_x) : (x2 + w2 - inter_x);
        inter_h = ((y1 + h1) < (y2 + h2)) ? (y1 + h1 - inter_y) : (y2 + h2 - inter_y);
        inter_area = inter_w * inter_h;
        union_area = (w1 * h1) + (w2 * h2) - inter_area;
        iou = (inter_area << 10) / union_area; // Fixed-point division
    end
endmodule
