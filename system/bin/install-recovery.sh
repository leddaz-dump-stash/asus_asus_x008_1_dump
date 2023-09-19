#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:11518208:05f6d52efe537ed76b1f97138537996bf5f708e0; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:9191680:6514bf908f1539ac1fd7e23482587c464d880659 EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery 05f6d52efe537ed76b1f97138537996bf5f708e0 11518208 6514bf908f1539ac1fd7e23482587c464d880659:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
