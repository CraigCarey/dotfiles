#!/bin/bash

# Frequencies: 384, 450, 480, 540, 576, 600, 612, 625,
#              636, 648, 660, 672, 684, 700, 720, 744, 
#              756, 768, 796, 832, 852, 876, 900, 924, 954
# Best results: ~4.4MH & hw error of .5% @ 756 0.75v

readonly BFG_MINER="/home/pi/mining/bfgminer_5.4.2/bfgminer"
readonly CLOCK_FQ="768"

## Litecoinpool
# Litecoin
# "$BFG_MINER" --scrypt -o stratum+tcp://litecoinpool.org:3443 -u cragglesltc.1 -p 1,d=128 -S ALL --set MLD:clock="$CLOCK_FQ"

# freq - Mh/s - HW
# 660 - 
# 672 - 
# 684 - 
# 700 - 
# 720 - 
# 744 - 
# 756 - 3.86 - .59
# 768 - 
# 796 - 

## Multipool
# Multi-pool (most profitable)
"$BFG_MINER" --scrypt -o stratum+tcp://eu.multipool.us:7777 -u cragglesaur.1 -p x,d=128 -S ALL --set MLD:clock="$CLOCK_FQ"
# AuroraCoin
# "$BFG_MINER" --scrypt -o stratum+tcp://eu.multipool.us:3362 -u cragglesaur.1 -p x,d=128 -S ALL --set MLD:clock="$CLOCK_FQ"
# Digibyte
# "$BFG_MINER" --scrypt -o stratum+tcp://eu.multipool.us:3351 -u cragglesaur.1 -p x,d=128 -S ALL --set MLD:clock="$CLOCK_FQ"
# Game Credits
#"$BFG_MINER" --scrypt -o stratum+tcp://eu.multipool.us:3336 -u cragglesaur.1 -p x,d=128 -S ALL --set MLD:clock="$CLOCK_FQ"
# Gulden
# "$BFG_MINER" --scrypt -o stratum+tcp://eu.multipool.us:3339 -u cragglesaur.1 -p x,d=128 -S ALL --set MLD:clock="$CLOCK_FQ"
# DNotes 3346
# "$BFG_MINER" --scrypt -o stratum+tcp://eu.multipool.us:3346 -u cragglesaur.1 -p x,d=128 -S ALL --set MLD:clock="$CLOCK_FQ"
# Verge
# "$BFG_MINER" --scrypt -o stratum+tcp://eu.multipool.us:3341 -u cragglesaur.1 -p x,d=128 -S ALL --set MLD:clock="$CLOCK_FQ"
# "$BFG_MINER" --scrypt -o stratum+tcp://eu.multipool.us:3341 -u cragglesaur.1 -p x, -S ALL
## Benchmarking
# "$BFG_MINER" --benchmark --scrypt -o stratum+tcp://litecoinpool.org:3333 -u cragglesltc.1 -p 1,d=128 -S ALL --set MLD:clock="$CLOCK_FQ"

# freq - Mh/s - HW
# 660 - 3.88 - 0
# 672 - 3.93 - 0
# 684 - 1.8 - 0
# 700 - 4.09 - 0
# 720 - 4.22 - 0
# 744 - 4.35 - 0
# 756 - 4.40 - 0
# 768 - 3.77 - 0
# 796 - 2.7 - .6

