module full_adder( 
    input a, b,
    input cin,
    output cout,
    output sum );
    
    assign cout = (a & b) | (b & cin) | (cin & a);
    assign sum = a ^ b ^ cin;

endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    full_adder fa1(a[0], b[0], cin, cout[0], sum[0]);
    genvar i;
    generate
        for ( i = 1; i < 100; i++) begin : gen_block
            full_adder fa(a[i], b[i], cout[i-1], cout[i], sum[i]);
        end
    endgenerate

endmodule
