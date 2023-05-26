echo "running assembler for program.asm ...\n"
g++ assembler.cpp -o assembler.out
./assembler.out < program.asm
rm assembler.out
echo "successfully assembled program.asm and generated Instruction Dram !!\n"
echo "Please place DRAM_inst.dat under \"00_TESTBEd/DRAM\"" 
echo "Also check out instr.objdump as object dump file!"