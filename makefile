

all:
	arm-none-linux-gnueabihf-gcc memcmp.s main.c -o main -z noexecstack -g

run:
	qemu-arm -L $(HOME)/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc main

debug:
	qemu-arm -L $(HOME)/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-linux-gnueabihf/arm-none-linux-gnueabihf/libc -g 1234 main

clean:
	rm -rf main