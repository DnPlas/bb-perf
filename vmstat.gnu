# General Settings
#
set terminal pngcairo enhanced font 'Verdana,8'
set xlabel 'Time (s)'
set term png size 1000, 900

# Procs
set output 'vmstat-procs.png'
set title 'Processing jobs waiting to run'
set multiplot layout 2,1 rowsfirst
plot data using 1 with lines title 'Runnable (r)'
plot data using 2 with lines title 'Uninterruptible sleep (b)'
unset multiplot
unset ylabel

# Memory
set output 'vmstat-memory.png'
set title 'Memory'
set ylabel 'GB'
set multiplot layout 4,1 rowsfirst
plot data using 3 with lines title 'Virtual Memory Used (swpd)'
plot data using ($4/1048576.) with lines title 'Idle Memory (free)'
plot data using ($6/1048576.) with lines title 'Idle Memory (cache)'
set ylabel 'MB'
plot data using ($5/1024.) with lines title 'Idle Memory (buff)'
unset ylabel
unset multiplot

# Swap
set output 'vmstat-swap.png'
set title 'Swap'
set multiplot layout 2,1 rowsfirst
plot data using 7 with lines title 'Swapped in from disk (si)'
plot data using 8 with lines title 'Swapped to disk (so)'
unset multiplot

# IO
set output 'vmstat-io.png'
set title 'IO'
set multiplot layout 2,1 rowsfirst
set ylabel '# Blocks received'
plot data using 9 with lines title  'Blocks received from a block device (bi)'
set ylabel '# Blocks sent'
plot data using 10 with lines title 'Blocks sent to a block device (bo)'
unset multiplot
unset ylabel

# System
set output 'vmstat-system.png'
set title 'System'
set multiplot layout 2,1 rowsfirst
plot data using 11 with lines title 'Interrupts per second (in)
plot data  using 12 with lines title 'Context switches per second (cs)'
unset multiplot

# CPU
set output 'vmstat-cpu.png'
set title 'CPU'
set multiplot layout 2,2 rowsfirst
plot data using 13 with lines title 'Time spent running non-kernel-code (us)'
plot data using 14 with lines title 'Time spent running kernel-code (sy)'
plot data using 15 with lines title 'Time spent idle (id)'
plot data using 16 with lines title 'Time spent waiting for IO (wa)'
unset multiplot

