#!/bin/bash


#para N potencia de 2 hasta 2^26
for ((N=16384;N<67108865;N=N*2))
do
   time ./ejercicio7 $N 
done
