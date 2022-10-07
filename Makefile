all: help

help:
	echo "make clean"
	echo "make init"

init:
	mkdir build;cd build; cmake ..

build/busscan.uf2: busscan.c
	cd build; make

build: build/busscan.uf2

install: build/busscan.uf2
	picotool load build/busscan.uf2

info:
	picotool info -a

clean:
	rm -Rvf build

