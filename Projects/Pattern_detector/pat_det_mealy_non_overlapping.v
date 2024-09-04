//patter- BBCBB
module pt_dt(clk_i,rst_i,d_i,valid_i,pattern_detected_o);

parameter S_RESET = 5'b0_0001;
parameter S_B     = 5'b0_0010;
parameter S_BB    = 5'b0_0100;
parameter S_BBC   = 5'b0_1000;
parameter S_BBCB  = 5'b1_0000;

input clk_i,rst_i,d_i,valid_i;
output reg pattern_detected_o;

reg [4:0]ps;//to hold presetn state
reg [4:0]ns;//to hold next state

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
					if(d_i == 1) 
						ns = S_B;
					else	
						ns = S_RESET;
				end
				S_B: begin
					if(d_i == 1)
				 		ns = S_BB;
					else
						ns = S_RESET;
				end
				S_BB: begin
						if(d_i == 0)
				 		ns = S_BBC;
					else
						ns = S_BB;
				end
				S_BBC: begin
					if(d_i == 1)
						ns = S_BBCB;
					else
						ns = S_RESET;
				end
				S_BBCB: begin
					if(d_i == 1) begin
						pattern_detected_o = 1;
						ns = S_RESET; //for non overlapping
					end
					else begin
						ns = S_RESET;
					end	
				end
			endcase
		end	
	end		
end

always@(ns) begin
		ps = ns;
end
endmodule







