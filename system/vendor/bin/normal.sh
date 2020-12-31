config=/storage/emulated/0/Android/panel_grus-opt.txt
config1=/data/adb/modules/mi9se/file/panel_grus-opt.txt
powersave=/vendor/bin/powersave.sh
balance=/vendor/bin/balance.sh
performance=/vendor/bin/performance.sh

function log()
{
echo "[$($BusyBox date +%y-%m-%d\ %H:%M:%S)]$1
"
}

if [[ -f /cache/grus-opt.log ]]; then
touch /cache/grus-opt.log
fi
if [[ -f /cache/grus_opt_mode ]]; then
touch /cache/grus_opt_mode
fi

log "等待系统启动"

while [ 1 = 1 ]
do
sleep 3
boot_completed=$(getprop sys.boot_completed)
if [[ "$boot_completed" == "1" ]];
then
break
fi
done

log "系统启动完成"
log "等待45秒，提前应用配置会被系统覆盖"
sleep 45

while [ 1 = 1 ]
do
sleep 3
if [[ -f $config ]];
then
log "正在加载模块配置..."
touch $config1
cp $config $config1
break
fi
done

cat1=`cat $config`
cat2=`cat $config1`
if [[ $cat1 == $cat2 ]]; then
log "加载模块配置成功"
fi

log "正在加载uperf配置"

uperf_config=/data/adb/modules/mi9se/file/cfg_uperf.json
uperf_config1=/data/adb/modules/uperf/config/cfg_uperf.json
if [[ -f $uperf_config ]];
then
cp $uperf_config $uperf_config1
cat3=`cat $config`
cat4=`cat $config1`
 if [[ $cat3 == $cat4 ]]; then
 log "加载uperf配置成功"
 fi
else
log "未安装uperf，加载失败
uperf下载地址:github.com/yc9559/uperf/releases"
fi

log "开始应用配置"

function get_prop() {
  cat $config | grep -v '^#' | grep "^$1=" | cut -f2 -d '='
}
power_config=$(get_prop normal_power_mode)

sh "/vendor/bin/$power_config.sh"
sleep 1
power_config1=`cat /cache/grus_opt_mode`
if [[ $power_config == $power_config1 ]]; then
log "应用$power_config配置成功"
else
log '应用失败，请截图log反馈'

log "开始运行优化脚本"
log_file=/cache/grus-opt.log
sh /vendor/bin/grus_opt.sh >> $log_file 2>&1
