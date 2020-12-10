transcript on
if ![file isdirectory Audio_Codec_iputf_libs] {
	file mkdir Audio_Codec_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

