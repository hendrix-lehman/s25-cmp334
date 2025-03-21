PROG=hello

SRC_DIR=src
BUILD_DIR=build

SRC=$(wildcard $(SRC_DIR)/*.s)

all:
	mips-linux-gnu-as $(SRC) -o $(BUILD_DIR)/$(PROG).o
	mips-linux-gnu-ld $(BUILD_DIR)/$(PROG).o -o $(BUILD_DIR)/$(PROG)

clean:
	rm -rf $(BUILD_DIR)/*

run:
	qemu-mips $(BUILD_DIR)/$(PROG) || true

# sycalls codes
# https://syscalls.w3challs.com/?arch=mips_o32
