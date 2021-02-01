SKIPMOUNT=false

PROPFILE=true

POSTFSDATA=true

LATESTARTSERVICE=true

REPLACE="
"

print_modname() {
  ui_print "- 作者：酷安@leleleha"
  ui_print "- 当前版本:v2.0.8"
  ui_print "- 默认性能配置为balance"
  ui_print "- 比官方更流畅的同时更省电"
}
  
  if [[ -f /data/adb/modules/uperf/module.prop ]];
  then
  ui_print "- 检测到已安装uperf"
  else
  ui_print "! 检测到未安装uperf，建议安装"
  ui_print "! github.com/yc9559/uperf"
  fi

  touch /storage/emulated/0/Android/panel_grus-opt.txt
  echo "
#修改开机默认性能配置
#powersave省电 
#balance平衡
#performance性能 （高耗电）
#默认balance
normal_power_mode=balance
" > /storage/emulated/0/Android/panel_grus-opt.txt

  echo "default_mode=performance" > /storage/emulated/0/Android/panel_uperf.txt

set_permissions() {
  set_perm_recursive $MODPATH/system 0 0 0755 0644
}

on_install() {
  ui_print "- 解压文件中"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  unzip -o "$ZIPFILE" 'file/*' -d $MODPATH >&2
}
