copy implementation\system.bit ..\bit_files\darkquad29_wvl_2018_Apr_21_1621.bit
mkbof.exe -o implementation\system.bof -s core_info.tab -t 3 implementation\system.bin
copy implementation\system.bof ..\bit_files\darkquad29_wvl_2018_Apr_21_1621.bof
copy design_info.tab ..\bit_files\darkquad29_wvl_2018_Apr_21_1621.info
