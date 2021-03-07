echo -e "======/nCPU/n======"
lscpu | sed -n 's/CPU(s)/p'
echo -e "======/nMemory:/n======"
free -h | sed -n 1,2p;sed 's,Gi,G'
echo -e "======/nDisks:/n======"
df -h | sed -n '/T/ p'
echo -e "======/nDate:/n======"
date | sed 's/Fri/Friday,/'
;sed 's/Feb/February/'
;sed 's/AM/a.m./'
;sed 's/EST/Eastern Standard/'

