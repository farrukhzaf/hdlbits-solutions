module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    
    
    wire[1:0] ena_ss, ena_mm, ena_hh;
    reg [7:0] ss_next, mm_next, hh_next;
    reg pm_next;

    always @(posedge clk) begin
        if(reset) begin
            pm <= 0;
            hh[7:4] <= 1;
            hh[3:0] <= 2;
            mm[7:4] <= 0;
            mm[3:0] <= 0;
            ss[7:4] <= 0;
            ss[3:0] <= 0;
        end
        
        else if(ena) begin
            hh <= hh_next;
            mm <= mm_next;
            ss <= ss_next;
            pm <= pm_next;
        end
    end
    
    assign ena_ss[0] = (ss[3:0] == 9) ? 1 : 0;
    assign ena_ss[1] = ((ss[7:4] == 5)&&(ss[3:0] == 9)) ? 1 : 0;
    assign ena_mm[0] = ((mm[3:0] == 9)&&(ss[7:4] == 5)&&(ss[3:0] == 9)) ? 1 : 0;
    assign ena_mm[1] = ((mm[7:4] == 5)&&(mm[3:0] == 9)&&(ss[7:4] == 5)&&(ss[3:0] == 9)) ? 1 : 0;
    assign ena_hh[0] = ((hh[3:0] == 9)&&(mm[7:4] == 5)&&(mm[3:0] == 9)&&(ss[7:4] == 5)&&(ss[3:0] == 9)) ? 1 : 0;
    assign ena_hh[1] = ((hh[7:4] == 1)&&(hh[3:0] == 1)&&(mm[7:4] == 5)&&(mm[3:0] == 9)&&(ss[7:4] == 5)&&(ss[3:0] == 9)) ? 1 : 0;
    
    always @(*) begin
        
        if(ena_ss[0])
            ss_next[3:0] = 0;
        else
            ss_next[3:0] = ss[3:0] + 1;
        
        if(ena_ss[0]) begin
            if(ss[7:4]==5)
                ss_next[7:4]=0;
            else
                ss_next[7:4]=ss[7:4]+1;
        end else
            ss_next[7:4] = ss[7:4];
        
        if(ena_ss[1]) begin
            if(mm[3:0]==9)
                mm_next[3:0]=0;
            else
                mm_next[3:0]=mm[3:0]+1;
        end else
            mm_next[3:0] = mm[3:0];
        
        if(ena_mm[0]) begin
            if(mm[7:4]==5)
                mm_next[7:4]=0;
            else
                mm_next[7:4]=mm[7:4]+1;
        end else
            mm_next[7:4] = mm[7:4];
        
       // In the always @(*) block:
		if(ena_mm[1]) begin
    		if(hh[7:4] == 1 && hh[3:0] == 2) begin  // 12 -> 1
        		hh_next[7:4] = 0;
        		hh_next[3:0] = 1;
    		end else if(hh[3:0] == 9) begin  // x9 -> (x+1)0
        		hh_next[7:4] = hh[7:4] + 1;
        		hh_next[3:0] = 0;
    		end else begin  // Normal increment
        	hh_next[7:4] = hh[7:4];
        	hh_next[3:0] = hh[3:0] + 1;
    		end
		end else begin  // Add missing else condition
    		hh_next[7:4] = hh[7:4];
    		hh_next[3:0] = hh[3:0];
	    end
        
        
        
        
        
        if(ena_hh[1]) begin
            pm_next = pm + 1;
        end else
            pm_next = pm;
            
        
    end
    
        
        

endmodule
