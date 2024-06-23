
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE10_LITE_Small(

	//////////// CLOCK //////////
	input 		          		ADC_CLK_10,
	input 		          		MAX10_CLK1_50,
	input 		          		MAX10_CLK2_50,


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


	//////////// Accelerometer //////////
	output		          		GSENSOR_CS_N,
	input 		     [2:1]		GSENSOR_INT,
	output		          		GSENSOR_SCLK,
	inout 		          		GSENSOR_SDI,
	inout 		          		GSENSOR_SDO

	
);



//=======================================================
//  REG/WIRE declarations
//=======================================================


wire DLY_RST;


reg  [31:0]	Cont;
wire [23:0]	mSEG7_DIG;
wire	        spi_clk, spi_clk_out;
wire 			resrt_n;
wire	[15:0]  data_x;

//=======================================================
//  Structural coding
//=======================================================
//
//assign DRAM_DQ 	   =  16'hzzzz;
//assign ARDUINO_IO 	=  16'hzzzz;
//assign GPIO		  		=	36'hzzzzzzzz;


//assign VGA_CLK = VGA_CTRL_CLK;
assign resrt_n = KEY[0];

always@(posedge MAX10_CLK2_50)
    begin
			 Cont	<=	Cont+1;
    end
	 

assign	LEDR      	=	resrt_n? ( SW[0] ? led_gensor : {	Cont[25:24],Cont[25:24],Cont[25:24],Cont[25:24],Cont[25:24]	} ) :10'h3ff
;
assign	mSEG7_DIG	=	resrt_n? {	Cont[27:24],Cont[27:24],Cont[27:24],Cont[27:24],Cont[27:24],Cont[27:24] } :{6{4'b1000}};


Reset_Delay			r0	(	.iCLK(MAX10_CLK1_50),
								.oRESET(DLY_RST)	);

							

SEG7_LUT_6 			u0	(	.oSEG0(HEX0),
							   .oSEG1(HEX1),
							   .oSEG2(HEX2),
							   .oSEG3(HEX3),
								.oSEG4(HEX4),
								.oSEG5(HEX5),
							   .iDIG(mSEG7_DIG) );

  			
							
//  Initial Setting and Data Read Back
spi_ee_config u_spi_ee_config (			
						.iRSTN(DLY_RST),															
						.iSPI_CLK(spi_clk),								
						.iSPI_CLK_OUT(spi_clk_out),								
						.iG_INT2(GSENSOR_INT[1]),            
						.oDATA_L(data_x[7:0]),
						.oDATA_H(data_x[15:8]),
						.SPI_SDIO(GSENSOR_SDI),
						.oSPI_CSN(GSENSOR_CS_N),
						.oSPI_CLK(GSENSOR_SCLK));
			
wire [9:0] led_gensor;
			
			//	LED
led_driver u_led_driver	(	
						.iRSTN(DLY_RST),
						.iCLK(MAX10_CLK1_50),
						.iDIG(data_x[9:0]),
						.iG_INT2(GSENSOR_INT[1]),            
						.oLED(led_gensor));
							


endmodule
