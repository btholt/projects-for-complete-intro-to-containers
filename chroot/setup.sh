#!/bin/bash

mkdir /my-new-root
echo "my super secret thing" >> /my-new-root/secret.txt
mkdir /my-new-root/bin
cp /bin/bash /bin/ls /my-new-root/bin/
mkdir /my-new-root/lib{,64}

# libraries for bash and ls
cp /lib/x86_64-linux-gnu/libtinfo.so.5 /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/libpcre.so.3 /lib/x86_64-linux-gnu/libpthread.so.0 /my-new-root/lib
cp /lib64/ld-linux-x86-64.so.2 /my-new-root/lib64

# cat exercise
cp /bin/cat /my-new-root/bin

chroot /my-new-root bash
