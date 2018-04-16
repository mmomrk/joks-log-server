#this is not an executable script in order to be able to pass arguments. Cheers
if (!exists("filename")) filename='trimmed.dat'
if (!exists("period")) period=1

set terminal pngcairo size 1024,768 
set output "out.png"
set key autotitle columnheader

set xdata time
set timefmt "%y.%m.%d-%H.%M.%S"

set title "pH in time"
set xlabel "Time, Minutes:Seconds"
set ylabel "pH"


plot filename u 1:6

