#!/bin/bash

function freespaceme(){
echo "generate full size"
mkdir /home/jeongho/mnt/fill/
fallocate -l $(($(df -h | grep sdb | awk '{print $2}' | sed 's/G//g')/3))G /home/jeongho/mnt/fill/fillme.buf 2>/dev/null
fallocate -l $(($(df -h | grep sdb | awk '{print $2}' | sed 's/G//g')/3))G /home/jeongho/mnt/fill/fillme.warm 2>/dev/null
fallocate -l $(($(df -h | grep sdb | awk '{print $2}' | sed 's/G//g')/3))G /home/jeongho/mnt/fill/fillme.sst 2>/dev/null
openssl enc -aes-256-ctr -pass pass:"$(dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64)" -nosalt < /dev/zero > /home/jeongho/mnt/fill/fillme.buf 2>/dev/null
openssl enc -aes-256-ctr -pass pass:"$(dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64)" -nosalt < /dev/zero > /home/jeongho/mnt/fill/fillme.warm 2>/dev/null
openssl enc -aes-256-ctr -pass pass:"$(dd if=/dev/urandom bs=128 count=1 2>/dev/null | base64)" -nosalt < /dev/zero > /home/jeongho/mnt/fill/fillme.sst 2>/dev/null

echo "just delete one"
rm /home/jeongho/mnt/fill/fillme.buf
}

freespaceme
