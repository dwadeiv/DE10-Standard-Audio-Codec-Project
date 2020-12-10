
`timescale 1 ns / 100 ps
module tb();
//reg  reset_n;
wire FPGA_I2C_SCLK;
wire FPGA_I2C_SDAT;
reg CLOCK_50;
wire AUD_BCLK;
wire AUD_DACDAT;
wire AUD_DACLRCK;
wire AUD_XCK

wire current_state[3:0] ;

wire AUD_DACDAT;
wire AUD_DACLRCK;
reg [3:0] reset_n;

Audio_Codec U0(
    .CLOCK_50 (CLOCK_50),
    .KEY (reset_n),
    .AUD_BCLK (AUD_BCLK),
    .AUD_DACDAT (AUD_DACDAT),
    .AUD_XCK (AUD_XCK),
    .FPGA_I2C_SCLK (FPGA_I2C_SCLK),
    .FPGA_I2C_SDAT (FPGA_I2C_SDAT)



);




always
    #10 CLOCK_50 = ~CLOCK_50;
initial 
    begin
        //give initial values and trigger reset cycle
        CLOCK_50 = 0;
        reset_n = 0;
        #20 
        reset_n = 1;
        $display ($time ,"Starting Simulation of Lab 1.");
        #20000 
        reset_n = 0;
       
        #25000
            //Start again
        reset_n = 1; 
        
       
        #35000
            $display ($time ,"Work Done");

    end
endmodule 