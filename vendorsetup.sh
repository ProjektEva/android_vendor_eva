devices=( 'beryllium' 'cannon' 'davinci' 'evert' 'fajita' 'gauguin' 'ginkgo' 'guacamole' 'guacamoleb' 'hotdog' 'hotdogb' 'mata' 'oneplus3' 'phoenix' 'sunfish' 'sweet' 'TP1803' )

function lunch_devices() {
    add_lunch_combo eva_${device}-user
    add_lunch_combo eva_${device}-userdebug
}

for device in ${devices[@]}; do
    lunch_devices
done
