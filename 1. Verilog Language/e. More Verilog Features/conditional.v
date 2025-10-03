module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] i1 , i2;
    assign i1 = ( a > b ) ? b : a;
    assign i2 = ( c > d ) ? d : c;
    assign min = ( i1 > i2 ) ? i2 : i1;

endmodule
