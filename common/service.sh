#!/system/bin/sh
MODDIR=${0%/*}

if [[ -f $log_file ]]; then
touch $log_file
fi
log_file=/cache/grus-opt.log
echo -n "" > $log_file
sh /vendor/bin/normal.sh >> $log_file 2>&1
