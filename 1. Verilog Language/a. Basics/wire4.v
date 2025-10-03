module top_module( 
    input a,b,c,
    output w,x,y,z );
    
    always @(*) begin
        w = a;
        x = b;
        y = b;
        z = c;
    end

endmodule
