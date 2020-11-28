##########################################################################################
#
# Magisk Module Installer Script
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure and implement callbacks in this file
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Set to true if you do *NOT* want Magisk to mount
# any files for you. Most modules would NOT want
# to set this flag to true
SKIPMOUNT=false

# Set to true if you need to load system.prop
PROPFILE=true

# Set to true if you need post-fs-data script
POSTFSDATA=true

# Set to true if you need late_start service script
LATESTARTSERVICE=true

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your own list here
REPLACE="
"

print_modname() {
  ui_print "*******************************"
  ui_print "        作者：酷安@leleleha      "
  ui_print "        当前版本:v2.0           "
  ui_print "更新日志及其它使用事项可以在酷安动态找到"
  ui_print "     在重启之前一定一定要去看动态！！！"
  ui_print "     在重启之前一定一定要去看动态！！！"
  ui_print "     在重启之前一定一定要去看动态！！！"
  ui_print "*******************************"
}

  pm disable com.xiaomi.simactivate.service
  pm disable com.xiaomi.metoknlp
  pm disable com.xiaomi.location.fused
  pm disable com.wapi.wapicertmanage
  pm disable com.unionpay.tsmservice.mi
  pm disable com.qualcomm.wfd.service
  pm disable com.qualcomm.qti.poweroffalarm
  pm disable com.miui.yellowpage
  pm disable com.miui.mishare.connectivity
  pm disable com.miui.phrase
  ui_print "已冻结部分应用"
  
#创建配置文件
  touch /storage/emulated/0/Android/panel_grus-opt.txt
  echo "
#这是小米9se优化模块的配置文件
#如果你是在不知道的情况下看到此文件
#请移至酷安@leleleha的动态查看更新日志和注意事项
  
#修改开机默认性能配置
#powersave省电 balance平衡 performance性能(费电)
#默认省电
normal_power_mode=powersave" > /storage/emulated/0/Android/panel_grus-opt.txt

#应用uperf开机默认配置
#没什么用 反正也是会被覆盖的
  echo "default_mode=powersave" > /storage/emulated/0/Android/panel_uperf.txt

# Copy/extract your module files into $MODPATH in on_install.

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH/system 0 0 0755 0644

  # Here are some examples:
  # set_perm_recursive  $MODPATH/system/lib       0     0       0755      0644
  # set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0     0       0644
}

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}
