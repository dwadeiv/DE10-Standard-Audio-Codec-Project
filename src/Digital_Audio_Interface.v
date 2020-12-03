module Digital_Audio_Interface(
    // all outputs
    output AUD_DACDAT,
    output AUD_DACLRCK,
    output AUD_BCLK, // let it run
    // every 250 bclks generate lrc pulse
    // generated and taken aw3ay on falling edge of bclk
    // first rising edge, then send msb and the nexty 32 rising edges
    // read value out of memory 16 bits, clock it to codec, then clock it in 
    input [15:0] mem

);







endmodule