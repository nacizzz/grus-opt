#设置变量
little_up=/sys/devices/system/cpu/cpufreq/policy0/schedutil/up_rate_limit_us
little_down=/sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us
big_up=/sys/devices/system/cpu/cpufreq/policy6/schedutil/up_rate_limit_us
big_down=/sys/devices/system/cpu/cpufreq/policy6/schedutil/down_rate_limit_us
big_hispeed=/sys/devices/system/cpu/cpufreq/policy6/schedutil/hispeed_load
#设置权限
chmod 644 $little_up
chmod 644 $little_down
chmod 644 $big_up
chmod 644 $big_down
chmod 644 $big_hispeed
#应用参数
echo 1000 > $little_up
echo 20000 > $little_down
echo 500 > $big_up
echo 20000 > $big_down
echo 85 > $big_hispeed
#设置权限
chmod 444 $little_up
chmod 444 $little_down
chmod 444 $big_up
chmod 444 $big_down
chmod 444 $big_hispeed
#应用uperf模式
echo performance > /data/uperf_powermode