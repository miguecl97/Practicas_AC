#!/bin/bash
#Se asigna al trabajo el nombre SumaVectoresC_globales
#PBS -N SumaVectoresC_vlocales
#Se asigna al trabajo la cola ac
#PBS -q ac   


#Se ejecuta SumaVectorC, que está en el directorio en el que se ha ejecutado qsub,
#para N potencia de 2 hasta 2^26
for ((N=16384;N<67108865;N=N*2))
do
   ./ejercicio8 $N >>vglobalesMod2ATC.txt
done
