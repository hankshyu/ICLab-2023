#!/bin/sh
#rm -f RA1SH*
echo "  Memory Name ? "
read MEM_Name


mv $MEM_Name\.v $MEM_Name\_backup.v
cat $MEM_Name\_backup.v | sed 's/\([ \t]*\$setuphold[^,]\+,\)[ \t]*\(.*\)/\1posedge \2\n\1negedge \2/g' \
| sed "s/\([ \t]*\)(\([A-Z]\+ => \)\([^)]\+\)\(.*\)/\1(posedge \2(\3:1\'bx)\4/g" > $MEM_Name\.v

cp lc_shell.tcl $MEM_Name\_lc.tcl
sed -i -e "s|RA1SH|$MEM_Name|g" $MEM_Name\_lc.tcl
lc_shell -f $MEM_Name\_lc.tcl

