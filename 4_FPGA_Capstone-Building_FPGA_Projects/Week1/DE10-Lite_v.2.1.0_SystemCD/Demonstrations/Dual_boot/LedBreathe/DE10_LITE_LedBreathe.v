
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE10_LITE_LedBreathe(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// VGA //////////
	output		     [3:0]		VGA_B,
	output		     [3:0]		VGA_G,
	output		          		VGA_HS,
	output		     [3:0]		VGA_R,
	output		          		VGA_VS,

	//////////// Accelerometer //////////
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO,

	//////////// Arduino //////////
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,
   //////////// GPIO, GPIO connect to GPIO Default //////////
	inout 		    [35:0]		GPIO
	
);



//=======================================================
//  REG/WIRE declarations
//=======================================================


wire						reset_n;

reg 		[26:0]		counter;
reg 		[5:0]			PWM_adj;
reg		[6:0]			PWM_width;
reg   	[9:0]			display;
wire		[15:0]		data_x;

//=======================================================
//  Structural coding
//=======================================================
//
assign DRAM_DQ 	   =  16'hzzzz;
assign ARDUINO_IO 	=  16'hzzzz;
assign GPIO		  		=	36'hzzzzzzzz;

assign reset_n 		= KEY[0];

always @(posedge MAX10_CLK1_50 or negedge reset_n)
	begin
		if(!reset_n)
			begin
				counter <= 0;
				display <= 0;
			end
		else begin
				counter   <= counter+1;
				PWM_width <= PWM_width[5:0]+ PWM_adj;
				if(counter[26])
					begin
						PWM_adj <= counter[25:20];
					end
				else begin
						PWM_adj <= ~ counter[25:20];
					 end
				display[0] <= ~PWM_width[6];
				display[1] <= ~PWM_width[6];
				display[2] <= ~PWM_width[6];
				display[3] <= ~PWM_width[6];
				display[4] <= ~PWM_width[6];
				display[5] <= PWM_width[6];
				display[6] <= PWM_width[6];
				display[7] <= PWM_width[6];
				display[8] <= PWM_width[6];
				display[9] <= PWM_width[6];
			 end
	end


assign LEDR = ~display;
assign HEX0	= {display[3:0],display[3:0]};
assign HEX1	= {display[3:0],display[3:0]};
assign HEX2	= {display[3:0],display[3:0]};
assign HEX3	= {display[3:0],display[3:0]};
assign HEX4	= {display[3:0],display[3:0]};
assign HEX5	= {display[3:0],display[3:0]};


dual_boot u0 (
	.clk_clk       (MAX10_CLK1_50),	//   clk.clk
	.reset_reset_n (1'b1)				// reset.reset_n
);

endmodule
