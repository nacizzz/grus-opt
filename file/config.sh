little_up=/sys/devices/system/cpu/cpufreq/policy0/schedutil/up_rate_limit_us
little_down=/sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us
little_hispeed=/sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_load
big_up=/sys/devices/system/cpu/cpufreq/policy6/schedutil/up_rate_limit_us
big_down=/sys/devices/system/cpu/cpufreq/policy6/schedutil/down_rate_limit_us
big_hispeed=/sys/devices/system/cpu/cpufreq/policy6/schedutil/hispeed_load
uperf_flag=/data/adb/modules/uperf/module.prop
gpu_minpowerlever=/sys/class/kgsl/kgsl-3d0/min_pwrlevel
gpu_minfreq=/sys/class/kgsl/kgsl-3d0/min_clock_mhz

function log()
{
echo "[$($BusyBox date +%y-%m-%d\ %H:%M:%S)]$1
"
}
