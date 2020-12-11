panel=/storage/emulated/0/Android/panel_grus-opt.txt
panel1=/data/adb/modules/mi9se/file/panel_grus-opt.txt
powersave=/vendor/bin/powersave.sh
balance=/vendor/bin/balance.sh
performance=/vendor/bin/performance.sh
normal_panel_powersave=`$BusyBox grep 'normal_power_mode=powersave' "$panel1"`
normal_panel_balance=`$BusyBox grep 'normal_power_mode=balance' "$panel1"`
normal_panel_performance=`$BusyBox grep 'normal_power_mode=performance' "$panel1"`
date=`date`

echo "[$date]"

function set_default_config() {
echo "等待系统启动"
echo " "

while [ 1 = 1 ]
do
sleep 3
boot_completed=$(getprop sys.boot_completed)
if [[ "$boot_completed" == "1" ]]; then
break
echo "系统启动完成"
echo " "
fi
done

while [ 1 = 1 ]
do
sleep 3
if [[ -f $panel ]];
then
rm -rf $panel1
touch $panel1
cp $panel $panel1
break
echo "加载配置成功"
echo " "
fi
done

echo "等待60秒，过早应用配置会权限不足"
echo " "

sleep 60

echo "开始应用配置"
echo " "

if [[ $normal_panel_powersave == normal_power_mode=powersave ]];
then
sh $powersave
echo "应用省电配置成功"
echo " "
fi

if [[ $normal_panel_balance == normal_power_mode=balance ]];
then
sh $balance
echo "应用平衡配置成功"
echo " "
fi

if [[ $normal_panel_performance == normal_power_mode=performance ]];
then
sh $performance
echo "应用性能配置成功"
echo " "
fi

echo "两条报错为正常现象，请无视"
echo " "

echo "全部完成"
}

set_default_config
