#!/bin/csh -vx
set arr = (16384 32768 65536 131072 262144 524288 1048576 2097152 4194304 8388608 )
@ i = 1
while ( $i < 6 )
./SumaVectoresGlobal $arr[i] >> salida.dat
@ i += 1
end
