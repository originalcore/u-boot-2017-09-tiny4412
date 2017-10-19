#!/bin/bash

arm-linux-gcc - c mystart.s
arm-linux-gcc -c mylowlevel_init.s
arm-linux-ld -T mybot.lds -o myboot mystart.o mylowlevel_init.o
arm-linux-objcopy -O binary myboot myboot.bin
./mkv210 myboot.bin myboot.16k
sudo dd iflag=dsync oflag=dsync if=./myboot.16k of=/dev/sdb seek=1
