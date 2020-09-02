#!/bin/bash

swap_file="/swapfile"
phys_memory_total=$(grep "MemTotal" /proc/meminfo | awk '{ print $2 }')

mem_2gb=$(( 2 * 1024 ** 2))
mem_4gb=$(( 4 * 1024 ** 2))
mem_32gb=$(( 32 * 1024 ** 2))
swap_size=0

# ref.
# https://aws.amazon.com/jp/premiumsupport/knowledge-center/ec2-memory-swap-file/
if [ ${phys_memory_total} -le ${mem_2gb} ]; then
  swap_size=${mem_2gb}
elif [ ${phys_memory_total} -gt ${mem_2gb} ] && [ ${phys_memory_total} -le ${mem_32gb} ]; then
  swap_size=$(( ${mem_4gb} + (${phys_memory_total}) - ${mem_2gb}))
elif [ ${phys_memory_total} -gt ${mem_32gb} ]; then
  swap_size=${phys_memory_total}
fi


if [ ${phys_memory_total} -eq 0 ]; then
  echo "Error: Can't get physical memory size" && exit 1
else
  echo "Physical Memory Size: ${phys_memory_total}"
fi

if [ ${swap_size} -eq 0 ]; then
  echo "Error: Can't calcurate target swap size" && exit 1
else
  echo "Target Swap Size: ${swap_size}"
fi


if [ -e ${swap_file} ] ; then
  echo "Already exists swap space" && exit 1
else
  echo "Create swap file"
  sudo dd if=/dev/zero of=${swap_file} bs=1k count=${swap_size}
  sudo chmod 600 ${swap_file}
  echo "Init swap space"
  sudo mkswap ${swap_file} && sudo swapon ${swap_file}
  sudo swapon -s
fi

if [ $(grep -c ${swap_file} /etc/fstab) -eq 0 ]; then
  echo "Backup current fstab"
  sudo cp /etc/fstab ~/fstab.$(date "+%Y%m%d-%H%M%S")
  echo "Write swap entry to /etc/fstab"
  echo "${swap_file} swap swap defaults 0 0" | sudo tee -a /etc/fstab
else
  echo "Already swap entry in /etf/fstab" && exit 1
fi

