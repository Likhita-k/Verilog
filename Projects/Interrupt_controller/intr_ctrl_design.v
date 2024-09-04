module intr_ctrl(
//processor interface
//APB interface signals
pclk_i,prst_i,paddr_i,pwdata_i,pwrite_i,psel_i,penable_i,pready_o,prdata_o,
//intr_ctr signals
intr_valid_o,intr_to_service_o,intr_serviced_i,

//peripheral interface signals
//int_ctrl_signals
int_active_i
);

//parameters
parameter S_NO_INTR                                 = 3'b001;
parameter S_INTR_ACTIVE                             = 3'b010;
parameter S_INTR_GIVEN_TO_PROC_WAIT_TO_BE_SERVICED  = 3'b100;
parameter NUM_PER = 16;
parameter ADDR_WIDTH = $clog2(NUM_PER);

//port directions with size
input pclk_i;
input prst_i;
input psel_i;
input [ADDR_WIDTH-1:0] paddr_i;
input [ADDR_WIDTH-1:0] pwdata_i;
input pwrite_i;
input penable_i;
output reg pready_o;
output reg [ADDR_WIDTH-1:0] prdata_o;

output reg intr_valid_o;
output reg [ADDR_WIDTH-1:0] intr_to_service_o;
input intr_serviced_i;

input [NUM_PER-1:0] int_active_i;

//registers
reg [ADDR_WIDTH-1:0] priority_reg[NUM_PER-1:0];
integer i;
integer flag = 0;

//priority reg variables
integer highest_pri_val;
reg [NUM_PER-1:0] periph_num;
reg [2:0] state,next_state;

//priority_reg programming  -> APB interface
always@(posedge pclk_i)begin
	if(prst_i == 1) begin
		pready_o = 0;
		prdata_o = 0;
		for(i=0;i<NUM_PER;i=i+1) begin
			priority_reg[i] = 0;
		end
	end
	else begin
	//write and reds wrt priority_reg
			if(penable_i == 1) begin
				pready_o = 1;
				if(pwrite_i == 1) begin
					priority_reg[paddr_i] = pwdata_i;
				end
				else begin
					prdata_o = priority_reg[paddr_i]; 	
				end
			end
			else begin
				pready_o = 0;
			end	
	end
end

//INTR_CTRL state machine -> intr ctrl signals
always@(posedge pclk_i) begin
	if(prst_i == 1)begin
		intr_valid_o = 0;
		intr_to_service_o = 0;
		highest_pri_val = 0;
		periph_num = 0;
		state = S_NO_INTR;
		next_state = S_NO_INTR;
		flag = 0;
	end
	else begin
	//implement the state machine
		case(state)
			S_NO_INTR:begin
				if(int_active_i != 0) begin
					next_state = S_INTR_ACTIVE;
				end
				else begin
					next_state = S_NO_INTR;
				end
			end

			S_INTR_ACTIVE:begin
				for(i=0;i<NUM_PER;i=i+1) begin
					if(int_active_i[i] == 1) begin
						if(flag == 0) begin
							highest_pri_val = priority_reg[i];
							periph_num = i;
							flag = 1;
						end
						else begin
							if(priority_reg[i] > highest_pri_val) begin
								highest_pri_val = priority_reg[i];
								periph_num = i;
							end
						end
					end
				end	
				flag = 0;	
			//update intr registers
				intr_to_service_o = periph_num;
				intr_valid_o =1;
				next_state = S_INTR_GIVEN_TO_PROC_WAIT_TO_BE_SERVICED;
			end

			S_INTR_GIVEN_TO_PROC_WAIT_TO_BE_SERVICED:begin
				if(intr_serviced_i == 1) begin
				//	int_active_i[intr_to_service_o] = 0;// cannot be written here, because in design input cannot be changed.
					intr_valid_o = 0;
				
					if(int_active_i != 0)
						next_state = S_INTR_ACTIVE;	
					else 
						next_state = S_NO_INTR;
				end
			end
		endcase
	end
end

//state machine updating
always@(next_state)
	state = next_state;

endmodule
