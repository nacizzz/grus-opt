#!/system/bin/sh
# 请不要硬编码/magisk/modname/...;相反，请使用$MODDIR/...
# 这将使您的脚本兼容，即使Magisk以后改变挂载点
MODDIR=${0%/*}

# 该脚本将在设备开机后作为延迟服务启动

# 下面，你也可以添加一些自己的代码
#核心控制
echo 0 > /sys/devices/system/cpu/cpu0/core_ctl/enable
#vm参数
echo 1 > /proc/sys/vm/laptop_mode
echo 3 > /proc/sys/vm/dirty_background_ratio
echo 30 > /proc/sys/vm/overcommit_ratio
echo 100 > /proc/sys/vm/swap_ratio
echo 100 > /proc/sys/vm/vfs_cache_pressure
echo 10 > /proc/sys/vm/dirty_ratio
echo 3 > /proc/sys/vm/page-cluster
echo 1000 > /proc/sys/vm/dirty_expire_centisecs
echo 2000 > /proc/sys/vm/dirty_writeback_centisecs
#杀掉不必要的进程
killall -9 com.miui.guardprovider 2>/dev/null
killall -9 com.android.mms 2>/dev/null
killall -9 com.miui.weather2 2>/dev/null
killall -9 android.ext.services 2>/dev/null
killall -9 com.android.onetimeinitializer 2>/dev/null
killall -9 com.qualcomm.timeservice 2>/dev/null
killall -9 com.android.carrierconfig 2>/dev/null
killall -9 com.android.deskclock 2>/dev/null
killall -9 com.android.providers.calendar 2>/dev/null
killall -9 com.miui.core 2>/dev/null
killall -9 com.miui.notes 2>/dev/null
#杀死温控进程（并不是真正的关掉温控）
killall -9 vendor.qti.hardware.perf@1.0-service 2>/dev/null
killall -9 vendor.qti.hardware.perf@2.0-service 2>/dev/null
killall -9 android.hardware.thermal@1.0-service 2>/dev/null
killall -9 thermanager 2>/dev/null
killall -9 thermalserviced 2>/dev/null
killall -9 thermal-engine 2>/dev/null
killall -9 mi_thermald 2>/dev/null
#应用配置(默认省电)
sh /system/vendor/bin/powersave.sh
