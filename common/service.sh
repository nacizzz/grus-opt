#!/system/bin/sh
MODDIR=${0%/*}

log_file=/cache/grus-opt.log
echo -n "" > $log_file
sh /vendor/bin/normal.sh >> $log_file 2>&1
sh /vendor/bin/grus_opt.sh >> $log_file 2>&1
