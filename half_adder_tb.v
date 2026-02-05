module half_adder_tb;
reg a;
reg b;
wire sum;
wire carry;
half_adder ha(a,b,sum,carry);
initial begin
a=0;
b=0;
#10;
a=0;
b=1;
#10;
end 
endmodule
