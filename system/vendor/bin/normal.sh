config=/storage/emulated/0/Android/panel_grus-opt.txt
config1=/data/adb/modules/mi9se/file/panel_grus-opt.txt
powersave=/vendor/bin/powersave.sh
balance=/vendor/bin/balance.sh
performance=/vendor/bin/performance.sh
date=`date`

echo "[$date]"

echo "等待系统启动"
echo " "

while [ 1 = 1 ]
do
sleep 3
boot_completed=$(getprop sys.boot_completed)
if [[ "$boot_completed" == "1" ]];
then
break
fi
done

echo "系统启动完成"
echo " "
echo "等待45秒，提前应用配置会被系统覆盖"
echo " "
sleep 45

while [ 1 = 1 ]
do
sleep 3
if [[ -f $config ]];
then
echo "正在加载模块配置..."
echo " "
touch $config1
cp $config $config1
break
fi
done

echo "加载模块配置成功"
echo " "
echo "正在加载uperf配置"
echo " "

uperf_config=/data/adb/modules/mi9se/file/cfg_uperf.json
uperf_config1=/data/adb/modules/uperf/config/cfg_uperf.json
if [[ -f $uperf_config ]];
then
cp $uperf_config $uperf_config1
echo "加载uperf配置成功"
echo " "
else
echo "未安装uperf，加载失败"
echo "uperf下载地址:github.com/yc9559/uperf/releases"
echo " "
fi

echo "开始应用配置"
echo " "
function get_prop() {
  cat $config | grep -v '^#' | grep "^$1=" | cut -f2 -d '='
}
power_config=$(get_prop normal_power_mode)

sh "/vendor/bin/$power_config.sh"
sleep 3
power_config1=`cat /data/uperf_powermode`
echo "应用$power_config1配置成功"
echo " "

echo "开始运行优化脚本"
echo " "
log_file=/cache/grus-opt.log
sh /vendor/bin/grus_opt.sh >> $log_file 2>&1
