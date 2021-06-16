#!/system/bin/sh

module_path=/vendor/lib/modules

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=
device=$(getprop ro.boot.device)

wait_for_poweron()
{
	local wait_nomore
	local readiness
	local count
	wait_nomore=60
	count=0
	while true; do
		readiness=$(cat $touch_path/poweron)
		if [ "$readiness" == "1" ]; then
			break;
		fi
		count=$((count+1))
		[ $count -eq $wait_nomore ] && break
		sleep 1
	done
	if [ $count -eq $wait_nomore ]; then
		return 1
	fi
	return 0
}

# Load all needed modules
insmod $module_path/ets_fps_mmi.ko
insmod $module_path/exfat.ko
insmod $module_path/focaltech_0flash_mmi.ko
insmod $module_path/fpc1020_mmi.ko
insmod $module_path/lcd.ko
insmod $module_path/mmi_annotate.ko
insmod $module_path/mmi_info.ko
insmod $module_path/mmi_parallel_charger.ko
insmod $module_path/moto_f_usbnet.ko
insmod $module_path/nova_0flash_mmi.ko
insmod $module_path/qpnp-power-on-mmi.ko
insmod $module_path/qpnp_adaptive_charge.ko
insmod $module_path/sensors_class.ko
insmod $module_path/utags.ko

cd $firmware_path
touch_product_string=$(ls $touch_class_path)
firmware_file="focaltech-txd-ft8765-06-0000-odessa.bin"

touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | awk '{print $1}')
wait_for_poweron
echo $firmware_file > $touch_path/doreflash
echo 1 > $touch_path/forcereflash
sleep 5
echo 1 > $touch_path/reset

return 0