nasm -f bin hello2.asm -o boot.bin
qemu-system-x86_64 -hda ./boot.bin