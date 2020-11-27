panel=/storage/emulated/0/Android/panel_grus-opt.txt
powersave=/vendor/bin/powersave.sh
balance=/vendor/bin/balance.sh
performance=/vendor/bin/balance.sh

normal_panel_powersave=`$BusyBox grep '.*normal_power_mode=powersave*' "$panel"`
if 
[ $normal_panel_powersave == normal_power_mode=powersave ];
then 
sh $powersave
fi

if
normal_panel_balance=`$BusyBox grep '.*normal_power_mode=balance*' "$panel"`
[ $normal_panel_balance == normal_power_mode=balance ];
then 
sh $balance
fi

if
normal_panel_performance=`$BusyBox grep '.*normal_power_mode=performance*' "$panel"`
[ $normal_panel_performance == normal_power_mode=performance ];
then 
sh $performance
fi
