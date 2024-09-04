//patter- BCBBCB
module pt_dt_me_ol(clk_i,rst_i,d_i,valid_i,pattern_detected_o);

parameter B = 1;
parameter C =0;
parameter S_RESET  = 6'b00_0001;
parameter S_B      = 6'b00_0010;
parameter S_BC     = 6'b00_0100;
parameter S_BCB    = 6'b00_1000;
parameter S_BCBB   = 6'b01_0000;
parameter S_BCBBC  = 6'b10_0000;

input clk_i,rst_i,d_i,valid_i;
output reg pattern_detected_o;

reg [5:0]ps;//to hold presetn state
reg [5:0]ns;//to hold next state

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
					if(d_i == 1) begin
						pattern_detected_o = 1;
					//	ns = S_BCB; //overlapping case
						ns = S_RESET; // non-overlapping case
					end
					else 
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







