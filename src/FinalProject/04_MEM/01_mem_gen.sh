test $# -ne 5 && echo 'give 5 inputs under the order:\n    instance name \n    number of words \n    number of bits \n    mux type(4|8|16)\n    frequency (MHz) \n  ' && exit
/RAID2/EDA/memory/CBDK018_UMC_Artisan/orig_lib/aci/ra1sh_1/bin/ra1sh postscript verilog synopsys vclef-fp -instname $1 -words $2 -bits $3 -mux $4 -frequency $5 
grep area $1\_slow_syn.lib | sed '1d'

