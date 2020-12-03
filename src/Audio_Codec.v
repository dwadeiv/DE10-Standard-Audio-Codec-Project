
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Audio_Codec(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// Seg7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

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

	//////////// Audio //////////
	input 		          		AUD_ADCDAT,
	inout 		          		AUD_ADCLRCK,
	inout 		          		AUD_BCLK,
	output		          		AUD_DACDAT,
	inout 		          		AUD_DACLRCK,
	output		          		AUD_XCK,

	//////////// ADC //////////
	output		          		ADC_CONVST,
	output		          		ADC_DIN,
	input 		          		ADC_DOUT,
	output		          		ADC_SCLK,

	//////////// I2C for Audio and Video-In //////////
	output		          		FPGA_I2C_SCLK,
	inout 		          		FPGA_I2C_SDAT

);

// Creating states
parameter Wait_For_Transmit = 4'b0000;
parameter Start_Condition = 4'b0001;
parameter Send_Address = 4'b0010;
parameter ACK_1 = 4'b0011;
parameter Send_Data_1 = 4'b0100;
parameter ACK_2 = 4'b0101;
parameter Send_Data_2 = 4'b0110;
parameter ACK_3 = 4'b0111;
parameter Stop_Condition = 4'b1000;



//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] next_state;wire clk;
wire [7:0] Chip_Address;




//=======================================================
//  Structural coding
//=======================================================
/*
audio_pll audio_pll(
	.refclk   (CLOCK_50),  
	.rst      (~KEY[0]),  
	.outclk_0 (clk)
);
*/

clk_divider clk_divider(CLOCK_50, clk );
I2Cstate I2Cstate(
	.FPGA_I2C_SCLK (FPGA_I2C_SCLK),
	.FPGA_I2C_SDAT (FPGA_I2C_SDAT),
	.clk (clk),
	.reset_n (KEY[0])
);





endmodule