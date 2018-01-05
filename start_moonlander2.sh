## Litecoinpool
# Litecoin
./bfgminer --scrypt -o stratum+tcp://litecoinpool.org:3333 -u cragglesltc.1 -p 1,d=128 -S ALL --set MLD:clock=756

## Multipool
# AuroraCoin
#./bfgminer --scrypt -o stratum+tcp://eu.multipool.us:3362 -u cragglesaur.1 -p x,d=128 -S ALL --set MLD:clock=600
# Digibyte
#./bfgminer --scrypt -o stratum+tcp://eu.multipool.us:3351 -u cragglesaur.1 -p x,d=128 -S ALL --set MLD:clock=600
# Verge
# ./bfgminer --scrypt -o stratum+tcp://eu.multipool.us:3341 -u cragglesaur.1 -p x,d=128 -S ALL --set MLD:clock=600

## Benchmarking
# ./bfgminer --benchmark --scrypt -o stratum+tcp://litecoinpool.org:3333 -u cragglesltc.1 -p 1,d=128 -S ALL --set MLD:clock=756