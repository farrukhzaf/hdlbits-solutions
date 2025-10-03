module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout1, cout2;
    wire [31:0] b1;
    assign b1 = b ^ {32{sub}};
    
    add16 adder1(a[15:0], b1[15:0], sub, sum[15:0], cout1);
    add16 adder2(a[31:16], b1[31:16], cout1, sum[31:16], cout2);

endmodule
