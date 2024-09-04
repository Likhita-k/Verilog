`include "intr_ctrl_design.v"

module tb_new;
parameter NUM_PER = 16;
parameter ADDR_WIDTH = $clog2(NUM_PER);

reg pclk_i;
reg prst_i;
reg [ADDR_WIDTH-1:0] paddr_i;
reg [ADDR_WIDTH-1:0] pwdata_i;
reg pwrite_i;
reg psel_i;
reg penable_i;
reg intr_serviced_i;
reg [NUM_PER-1:0] int_active_i;

wire pready_o;
wire [ADDR_WIDTH-1:0] prdata_o;
wire intr_valid_o;
wire [ADDR_WIDTH-1:0] intr_to_service_o;

integer i,j,v,value;
event e1;
integer a[NUM_PER-1:0];

intr_ctrl dut(.pclk_i(pclk_i),.prst_i(prst_i),.paddr_i(paddr_i),.pwdata_i(pwdata_i),.pwrite_i(pwrite_i),.psel_i(psel_i),.penable_i(penable_i),.pready_o(pready_o),.prdata_o(prdata_o),.intr_valid_o(intr_valid_o),.intr_to_service_o(intr_to_service_o),.intr_serviced_i(intr_serviced_i),.int_active_i(int_active_i));

task reset();
begin
	paddr_i = 0;
	pwdata_i = 0;
	pwrite_i = 0;
	penable_i = 0;
	intr_serviced_i = 0;
	int_active_i = 0;
end
endtask

task write(input [ADDR_WIDTH-1:0] num_int, input [ADDR_WIDTH-1:0]int_data);
begin
		@(posedge pclk_i);
		paddr_i = num_int;
		pwdata_i = int_data;
		pwrite_i = 1;
		penable_i = 1;
		wait(pready_o == 1);
end
endtask

initial begin
	pclk_i = 0;
	forever #5 pclk_i = ~pclk_i;
end

initial begin
	prst_i = 1;
	reset();
	repeat(2) @(posedge pclk_i);
	prst_i = 0;
	-> e1;
end

initial begin 
	@(e1);
// generating random priority values 

	for(i = 0; i<NUM_PER; ) begin	
		v = $urandom_range(1,16);
		value = 0;
		for(j = 0; j<i; j=j+1) begin
			if(a[j] == v) begin
				value =1;
				j = i;
			end
		end

		if(value == 0) begin
			a[i] = v;
			write(i,a[i]);
			i = i+1;
		end
	end	
		@(posedge pclk_i);
		reset();

	//generating active interrupts
		int_active_i = $random;
		#1000;
end

//processor behaviour
always@(posedge pclk_i) begin
	if(intr_valid_o == 1) begin
		#50;
		intr_serviced_i = 1;
		int_active_i[intr_to_service_o] = 0;
	end	
	#5;
	intr_serviced_i = 0;
end

initial begin 
//	$value$plusargs("test_case=%s",test_case);
	#1500;
	$finish;
end	
endmodule

