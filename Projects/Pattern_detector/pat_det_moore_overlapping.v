//patter- BBCBB
module pt_dt_moore_ol(clk_i,rst_i,d_i,valid_i,pattern_detected_o);

parameter B = 1;
parameter C =0;
parameter S_RESET  = 7'b000_0001;
parameter S_B      = 7'b000_0010;
parameter S_BC     = 7'b000_0100;
parameter S_BCB    = 7'b000_1000;
parameter S_BCBB   = 7'b001_0000;
parameter S_BCBBC  = 7'b010_0000;
parameter S_BCBBCB = 7'b100_0000; 

input clk_i,rst_i,d_i,valid_i;
output reg pattern_detected_o;

reg [6:0]ps;//to hold presetn state
reg [6:0]ns;//to hold next state

always@(posedge clk_i) begin
	if(rst_i == 1) begin
		pattern_detected_o = 0;
		ps = S_RESET;
		ns = S_RESET;
	end	
	else begin
		pattern_detected_o=0;
		if(valid_i == 1) begin
			case(ps) 
					S_RESET: begin
					if(d_i == B) 
						ns = S_B;
					else	
						ns = S_RESET;
				end
				S_B: begin
					if(d_i == C)
				 		ns = S_BC;
					else
						ns = S_B;
				end
				S_BC: begin
						if(d_i == B)
				 		ns = S_BCB;
					else
						ns = S_RESET;
				end
				S_BCB: begin
					if(d_i == B)
						ns = S_BCBB;
					else
						ns = S_BC;
				end
				S_BCBB: begin
					if(d_i ==C)
						ns = S_BCBBC;
					else
						ns = S_B;
				end
				S_BCBBC: begin
					if(d_i == B) 
						ns = S_BCBBCB;
					else
						ns = S_RESET;
				end		
				S_BCBBCB: begin
					pattern_detected_o = 1;
					if(d_i == B) begin
						ns = S_BCBB; //overlapping case
					//	ns = S_RESET; // non-overlapping case
					end
					else 
					//	ns = S_BC; // overlapping
						ns = S_RESET;
						
				end
			endcase
		end	
	end		
end

always@(ns) begin
		ps = ns;
end
endmodule







