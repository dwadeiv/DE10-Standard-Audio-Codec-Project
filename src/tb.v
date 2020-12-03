
`timescale 1 ns / 100 ps
module tb();
reg  KEY;
wire FPGA_I2C_SCLK;
wire FPGA_I2C_SDAT;
reg clk;
wire current_state[3:0] ;
I2Cstate U0(
	.FPGA_I2C_SCLK (FPGA_I2C_SCLK),
	.FPGA_I2C_SDAT (FPGA_I2C_SDAT),
	.clk (clk),
	.KEY (KEY)
);






always
    #10 clk = ~clk;
initial 
    begin
        //give initial values and trigger reset cycle
        clk = 0;
        KEY = 0;
        #20 
        KEY = 1;
        $display ($time ,"Starting Simulation of Lab 1.");
        #20000 
        KEY = 0;
       
        #25000
            //Start again
        KEY = 1; 
        
       
        #35000
            $display ($time ,"Work Done");

    end
endmodule 