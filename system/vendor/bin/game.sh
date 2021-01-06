. /data/adb/modules/mi9se/file/config.sh
#设置权限
chmod 644 $little_up
chmod 644 $little_down
chmod 644 $little_hispeed
chmod 644 $big_up
chmod 644 $big_down
chmod 644 $big_hispeed
chmod 644 $cpu4_online
chmod 644 $cpu5_online
#应用参数
echo 500 > $little_up
echo 15000 > $little_down
echo 90 > $little_hispeed
echo 500 > $big_up
echo 15000 > $big_down
echo 85 > $big_hispeed
echo 1 > $cpu4_online
echo 1 > $cpu5_online
#设置权限
chmod 444 $little_up
chmod 444 $little_down
chmod 444 $little_hispeed
chmod 444 $big_up
chmod 444 $big_down
chmod 444 $big_hispeed
chmod 444 $cpu4_online
chmod 444 $cpu5_online
#设置schedboost
echo 1 > $schedboost
#应用uperf模式
if [[ -f $uperf_flag ]]; then
echo balance > /data/uperf_powermode
log "切换到game模式"
else
log "切换uperf模式失败，请安装uperf"
fi
