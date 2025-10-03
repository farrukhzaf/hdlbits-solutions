module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire cout1, cout2 , cout3;
    wire [31:16] sum0, sum1;
    add16 add1(a[15:0], b[15:0], 1'b0, sum[15:0], cout1);
    add16 add2(a[31:16], b[31:16], 1'b0, sum0[31:16], cout2);
    add16 add3(a[31:16], b[31:16], 1'b1, sum1[31:16], cout3);
    
    always @(*) begin
        
        case (cout1)
            1'b0: begin
                sum[31:16] = sum0;
            end
            
            1'b1: begin
                sum[31:16] = sum1;
            end
        endcase
    end
    
    
endmodule
