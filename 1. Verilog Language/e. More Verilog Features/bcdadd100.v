module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0]co;
    genvar i;
    bcd_fadd fa0( a[3:0], b[3:0], cin, co[0], sum[3:0]);
    generate
        
        for( i = 1; i < 100; i++) begin : for_loop
            bcd_fadd fa(a[4*i+3: 4*i], b[4*i+3: 4*i], co[i-1], co[i], sum[4*i+3: 4*i]);
        end
    endgenerate
    
    assign cout = co[99];
            

endmodule
