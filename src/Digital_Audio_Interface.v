module Digital_Audio_Interface(
    input reset_n,
    output AUD_DACDAT,
    output AUD_DACLRCK,
    output AUD_BCLK, // let it run
    // every 250 bclks generate lrc pulse
    // generated and taken aw3ay on falling edge of bclk
    // first rising edge, then send msb and the nexty 32 rising edges
    // read value out of memory 16 bits, clock it to codec, then clock it in 
    input [15:0] mem

);

audio_memory	audio_memory_inst (
	.address ( address ),
	.clock ( clkin ),
	.q (memOut )
);

wire [15:0] memOut;
reg [17:0] address;
wire [32:0] dataOut;
reg [7:0] clock_counter;
reg DACLRCK_DAT;
reg DataAcquisition;
reg [19:0] Q;

always @(negedge AUD_BCLK)
begin
    if (DataAcquisition == 1 && Q == 240264)
        Q <= 0;
    else if (Q != 240264)
        Q <= Q + 1;
    else
        Q <= 0;
end

always @(negedge AUD_BCLK or negedge reset_n)

    if (reset_n == 0)
    begin
        address = 0;
        clock_counter <= 0;
        DACLRCK_DAT = 0;
        DataAcquisition = 0;
    end

    else if (clock_counter == 250)
    begin
        clock_counter <= 1;
        DACLRCK_DAT = 1;
        address = Q;
        DataAcquisition = 1;

    end
    else if (clock_counter == 1 && DataAcquisition == 1)
    begin
        address = Q;
        DACLRCK_DAT = 0;
        clock_counter <= clock_counter + 1;
    end
    else
    begin
        clock_counter <= clock_counter + 1;
    end


endmodule