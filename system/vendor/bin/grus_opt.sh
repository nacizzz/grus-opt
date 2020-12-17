#核心控制
#sysctl -w net.ipv4.tcp_congestion_control=bbr
#echo "0-3" > /dev/cpuset/background/cpus
echo 0 > /sys/devices/system/cpu/cpu0/core_ctl/enable
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
killall -9 com.qualcomm.qti.poweroffalarm 2>/dev/null
#杀死温控进程（并不是真正的关掉温控）
killall -9 vendor.qti.hardware.perf@1.0-service 2>/dev/null
killall -9 vendor.qti.hardware.perf@2.0-service 2>/dev/null
killall -9 android.hardware.thermal@1.0-service 2>/dev/null
killall -9 thermanager 2>/dev/null
killall -9 thermalserviced 2>/dev/null
killall -9 thermal-engine 2>/dev/null
killall -9 mi_thermald 2>/dev/null
