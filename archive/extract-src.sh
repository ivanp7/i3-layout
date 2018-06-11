#!/bin/bash

for f in $@ 
do
	tar -xf $f
	mv ${f%%.tar.*} ~/src
done

