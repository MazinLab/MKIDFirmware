copy implementation\system.bit ..\bit_files\darkquad29_2018_Feb_08_1046.bit
mkbof.exe -o implementation\system.bof -s core_info.tab -t 3 implementation\system.bin
copy implementation\system.bof ..\bit_files\darkquad29_2018_Feb_08_1046.bof
copy design_info.tab ..\bit_files\darkquad29_2018_Feb_08_1046.info
