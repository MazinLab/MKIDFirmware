
PNAME=darkquad12
./mkbof_64 -o implementation/system.bof -s core_info.tab -t 3 implementation/system.bin
cp implementation/system.bof ../bit_files/$PNAME.bof
cp design_info.tab ../bit_files/
gzip -c ../bit_files/$PNAME.bof  > ../bit_files/$PNAME.bof.gz
gzip -c implementation/system.bin > implementation/system.bin.gz
cat implementation/system.bin.gz >> extended_info.kcpfpg
cp extended_info.kcpfpg ../bit_files/$PNAME.fpg
