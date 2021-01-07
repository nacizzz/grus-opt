. /data/adb/modules/mi9se/file/config.sh

#设置权限
chmod 644 $little_up
chmod 644 $little_down
chmod 644 $little_hispeed
chmod 644 $big_up
chmod 644 $big_down
chmod 644 $big_hispeed
#应用参数
echo 0 > $little_up
echo 0 > $little_down
echo 90 > $little_hispeed
echo 0 > $big_up
echo 0 > $big_down
echo 85 > $big_hispeed
#设置权限
chmod 444 $little_up
chmod 444 $little_down
chmod 444 $little_hispeed
chmod 444 $big_up
chmod 444 $big_down
chmod 444 $big_hispeed
#设置gpu
echo "5" > $gpu_minpowerlever
echo "180" > $gpu_minfreq
#提示当前模式
echo balance > /cache/grus_opt_mode
log "切换到balance模式"
#应用uperf模式
if [[ -f $uperf_flag ]]; then
echo balance > /data/uperf_powermode
else
log "切换uperf模式失败，请安装uperf"
fi
