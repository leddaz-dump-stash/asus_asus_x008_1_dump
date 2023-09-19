#!/system/bin/sh

LOG_DIR=/data/media/0/ASUS/LogUploader
#MODEM_LOG
MODEM_LOG=$LOG_DIR/modem
#MODEM_LOG=/sdcard/ASUS/LogUploader/modem
#TCP_DUMP_LOG
TCP_DUMP_LOG=$LOG_DIR/TCPdump
#TCP_DUMP_LOG=/sdcard/ASUS/LogUploader/TCPdump
#GENERAL_LOG
GENERAL_LOG=$LOG_DIR/general/sdcard
#GENERAL_LOG=/sdcard/ASUS/LogUploader/general/sdcard

#Dumpsys folder
DUMPSYS_DIR=$LOG_DIR/dumpsys

#BUSYBOX=busybox
SDCARD0=/data/media/0

savelogs_prop=`getprop persist.asus.savelogs`
is_tcpdump_status=`getprop init.svc.tcpdump-warp`

save_general_log() {
	echo "save_general_log" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# save cmdline
	#cat /proc/cmdline > $GENERAL_LOG/cmdline.txt 2>&1
	#echo "cat /proc/cmdline > $GENERAL_LOG/cmdline.txt" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# save mount table
#	cat /proc/mounts > $GENERAL_LOG/mounts.txt 2>&1
#	echo "cat /proc/mounts > $GENERAL_LOG/mounts.txt" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
#	getenforce > $GENERAL_LOG/getenforce.txt 2>&1
#	echo "getenforce > $GENERAL_LOG/getenforce.txt"	>> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# save property
	#getprop > $GENERAL_LOG/getprop.txt 2>&1
	#echo "getprop > $GENERAL_LOG/getprop.txt" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# save network info
	#cat /proc/net/route > $GENERAL_LOG/route.txt 2>&1
	#echo "cat /proc/net/route > $GENERAL_LOG/route.txt" >> $LOG_DIR/savelogs_log.txt
#	ifconfig -a > $GENERAL_LOG/ifconfig.txt 2>&1
#	echo "ifconfig -a > $GENERAL_LOG/ifconfig.txt" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# save software version
	#echo "AP_VER: `getprop ro.build.display.id`" > $GENERAL_LOG/version.txt >> $LOG_DIR/savelogs_log.txt
	#echo "CP_VER: `getprop gsm.version.baseband`" >> $GENERAL_LOG/version.txt >> $LOG_DIR/savelogs_log.txt
	#echo "BT_VER: `getprop bt.version.driver`" >> $GENERAL_LOG/version.txt >> $LOG_DIR/savelogs_log.txt
	#echo "WIFI_VER: `getprop wifi.version.driver`" >> $GENERAL_LOG/version.txt >> $LOG_DIR/savelogs_log.txt
	#echo "GPS_VER: `getprop gps.version.driver`" >> $GENERAL_LOG/version.txt >> $LOG_DIR/savelogs_log.txt
	#echo "BUILD_DATE: `getprop ro.build.date`" >> $GENERAL_LOG/version.txt >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# save load kernel modules
	#lsmod > $GENERAL_LOG/lsmod.txt 2>&1
	#echo "lsmod > $GENERAL_LOG/lsmod.txt" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# save process now
#	ps >  $GENERAL_LOG/ps.txt 2>&1
#	echo "ps > $SAVE_LOG_PATH/ps.txt" >> $LOG_DIR/savelogs_log.txt
#	ps -t -p > $GENERAL_LOG/ps_thread.txt 2>&1
#	echo "ps > $SAVE_LOG_PATH/ps_thread.txt" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# save kernel message
	#dmesg > $GENERAL_LOG/dmesg.txt 2>&1
	#echo "dmesg > $GENERAL_LOG/dmesg.txt" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# copy data/log to data/media
	#$BUSYBOX ls -R -l /data/log/ > $GENERAL_LOG/ls_data_log.txt
	#mkdir $GENERAL_LOG/log
	#$BUSYBOX cp /data/log/* $GENERAL_LOG/log/
	#echo "$BUSYBOX cp /data/log $GENERAL_LOG"
	############################################################################################
	# copy data/tombstones to data/media
	ls -R -l /data/tombstones/ > $GENERAL_LOG/ls_data_tombstones.txt 2>&1
	mkdir $GENERAL_LOG/tombstones
	cp /data/tombstones/* $GENERAL_LOG/tombstones/ >> $LOG_DIR/savelogs_log.txt
	echo "cp /data/tombstones $GENERAL_LOG" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	#Add by yinlili@wind-mobi.com for feature#100673 -s 
	# copy Debug Ion information to data/media
	# mkdir $GENERAL_LOG/ION_Debug
	# cp -r /d/ion/* $GENERAL_LOG/ION_Debug/
	#Add by yinlili@wind-mobi.com for feature#100673 -e
	############################################################################################
	# copy data/logcat_log to data/media
	#busybox ls -R -l /data/logcat_log/ > $GENERAL_LOG/ls_data_logcat_log.txt
	#$BUSYBOX cp -r /data/logcat_log/ $GENERAL_LOG
	#echo "$BUSYBOX cp -r /data/logcat_log $GENERAL_LOG"
	#mkdir $GENERAL_LOG/logcat_log
	# logcat & radio
	#if [ -d "/data/logcat_log" ]; then
	#	for x in logcat logcat-radio logcat-events
	#	do
	#		stop $x
	#		mv /data/logcat_log/$x.txt /data/logcat_log/$x.txt.0
	#		start $x
	#		mv /data/logcat_log/$x.txt.* $GENERAL_LOG/logcat_log
	#	done
	#else
	#    echo "/data/logcat_log not exist" >> $LOG_DIR/savelogs_log.txt
	#fi
	############################################################################################
	#[MTK] Save logs from here.
	#For MTK log, please create folder call mtklog, example: mkdir $GENERAL_LOG/mtk_log
	#then mv or cp logs to $GENERAL_LOG/mtklog, ex: mv log_folder_you_want_to_save $GENERAL_LOG/mtklog
	mkdir $GENERAL_LOG/mtklog
	if [ -d "${SDCARD0}/mtklog" ]; then
	    mkdir $GENERAL_LOG/mtklog/aee_exp
	    cp -a $SDCARD0/mtklog/aee_exp/* $GENERAL_LOG/mtklog/aee_exp/ >> $LOG_DIR/savelogs_log.txt 2>&1
	    mkdir $GENERAL_LOG/mtklog/mobilelog		
	    cp -a $SDCARD0/mtklog/mobilelog/* $GENERAL_LOG/mtklog/mobilelog >> $LOG_DIR/savelogs_log.txt 2>&1
	else
	    echo "${SDCARD0}/mtklog not exist" >> $LOG_DIR/savelogs_log.txt		
	fi	
	############################################################################################
	# copy /asdf/ASUSEvtlog.txt to ASDF
	#cp -r /sdcard/asus_log/ASUSEvtlog.txt $GENERAL_LOG #backward compatible
	#cp -r /sdcard/asus_log/ASUSEvtlog_old.txt $GENERAL_LOG #backward compatible
	#cp -r /asdf/ASUSEvtlog.txt $GENERAL_LOG
	#cp -r /asdf/ASUSEvtlog_old.txt $GENERAL_LOG
	#cp -r /asdf/ASDF $GENERAL_LOG
	#echo "cp -r /asdf/ASUSEvtlog.txt $GENERAL_LOG" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# copy /data/misc/wifi/wpa_supplicant.conf
	# copy /data/misc/wifi/hostapd.conf
	# copy /data/misc/wifi/p2p_supplicant.conf
	ls -R -l /data/misc/wifi/ > $GENERAL_LOG/ls_wifi_asus_log.txt  2>&1
	cp -r /data/misc/wifi/wpa_supplicant.conf $GENERAL_LOG
	echo "cp -r /data/misc/wifi/wpa_supplicant.conf $GENERAL_LOG" >> $LOG_DIR/savelogs_log.txt
	cp -r /data/misc/wifi/hostapd.conf $GENERAL_LOG
	echo "cp -r /data/misc/wifi/hostapd.conf $GENERAL_LOG" >> $LOG_DIR/savelogs_log.txt
	cp -r /data/misc/wifi/p2p_supplicant.conf $GENERAL_LOG
	echo "cp -r /data/misc/wifi/p2p_supplicant.conf $GENERAL_LOG" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# mv /data/anr to data/media
	ls -R -l /data/anr > $GENERAL_LOG/ls_data_anr.txt 2>&1
	mkdir $GENERAL_LOG/anr
	cp -a /data/anr/* $GENERAL_LOG/anr/
	echo "cp /data/anr $GENERAL_LOG" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
	# save system information
	mkdir $DUMPSYS_DIR
    for x in SurfaceFlinger window activity input_method alarm power battery batterystats; do
        dumpsys $x > $DUMPSYS_DIR/$x.txt
        echo "dumpsys $x > $DUMPSYS_DIR/$x.txt" >> $LOG_DIR/savelogs_log.txt
    done
    ############################################################################################
    # [BugReporter]Save ps.txt to Dumpsys folder
#    ps -t -p -P > $DUMPSYS_DIR/ps.txt 2>&1
    ############################################################################################
    #date > $GENERAL_LOG/date.txt 2>&1
	#echo "date > $GENERAL_LOG/date.txt" >> $LOG_DIR/savelogs_log.txt
	############################################################################################	
	# save debug report
#	dumpsys > $DUMPSYS_DIR/bugreport.txt 2>&1
#	echo "dumpsys > $DUMPSYS_DIR/bugreport.txt" >> $LOG_DIR/savelogs_log.txt
	############################################################################################
    #micropTest=`cat /sys/class/switch/pfs_pad_ec/state`
	#if [ "${micropTest}" = "1" ]; then
	#    date > $GENERAL_LOG/microp_dump.txt 2>&1
	#    cat /d/gpio >> $GENERAL_LOG/microp_dump.txt 2>&1
    #    echo "cat /d/gpio > $GENERAL_LOG/microp_dump.txt" >> $LOG_DIR/savelogs_log.txt  
    #    cat /d/microp >> $GENERAL_LOG/microp_dump.txt 2>&1
    #    echo "cat /d/microp > $GENERAL_LOG/microp_dump.txt" >> $LOG_DIR/savelogs_log.txt
	#fi
	############################################################################################
	df > $GENERAL_LOG/df.txt 2>&1
	echo "df > $GENERAL_LOG/df.txt" >> $LOG_DIR/savelogs_log.txt
}

save_modem_log() {
	echo "save_modem_log" >> $LOG_DIR/savelogs_log.txt	
	#mv /data/media/diag_logs/QXDM_logs $MODEM_LOG 
	#echo "mv /data/media/diag_logs/QXDM_logs $MODEM_LOG
	if [ -d "${SDCARD0}/mtklog" ]; then
	    mkdir $MODEM_LOG/mdlog1		
	    cp -a $SDCARD0/mtklog/mdlog1/* $MODEM_LOG/mdlog1 >> $LOG_DIR/savelogs_log.txt 2>&1
		if [ -d "${SDCARD0}/mtklog/c2kmdlog" ]; then
	        mkdir $MODEM_LOG/c2kmdlog			
	        cp -a $SDCARD0/mtklog/c2kmdlog/* $MODEM_LOG/c2kmdlog >> $LOG_DIR/savelogs_log.txt 2>&1
		fi
	else
	    echo "${SDCARD0}/mtklog not exist" >> $LOG_DIR/savelogs_log.txt			
	fi	
}

save_tcpdump_log() {
	echo "save_tcpdump_log" >> $LOG_DIR/savelogs_log.txt	
	#if [ -d "/data/logcat_log" ]; then
	#	if [ ".$is_tcpdump_status" == ".running" ]; then
	#		stop tcpdump-warp
	#		mv /data/logcat_log/capture.pcap0 /data/logcat_log/capture.pcap0-1
	#		start tcpdump-warp
	#		for fname in /data/logcat_log/capture.pcap*
	#		do
	#			if [ -e $fname ]; then
	#				if [ ".$fname" != "./data/logcat_log/capture.pcap0" ]; then
	#					mv $fname $TCP_DUMP_LOG
	#				fi
	#			fi
	#		done
	#	else
	#		mv /data/logcat_log/capture.pcap* $TCP_DUMP_LOG
	#	fi
	#fi
	if [ -d "${SDCARD0}/mtklog" ]; then
		mkdir $TCP_DUMP_LOG/netlog
		cp -a $SDCARD0/mtklog/netlog/* $TCP_DUMP_LOG/netlog/ >> $LOG_DIR/savelogs_log.txt 2>&1
	else
		echo "${SDCARD0}/mtklog not exist" >> $LOG_DIR/savelogs_log.txt				
	fi    
}

remove_folder() {
	# remove folder
	echo "remove_folder" >> $LOG_DIR/savelogs_log.txt
	if [ -e $GENERAL_LOG ]; then
		rm -r $GENERAL_LOG
	fi
	
	if [ -e $MODEM_LOG ]; then
		rm -r $MODEM_LOG
	fi
	
	if [ -e $TCP_DUMP_LOG ]; then
		rm -r $TCP_DUMP_LOG
	fi

	if [ -e $DUMPSYS_DIR ]; then
		rm -r $DUMPSYS_DIR
	fi
}

create_folder() {
	# create folder
	echo "create_folder" >> $LOG_DIR/savelogs_log.txt
	mkdir -p $GENERAL_LOG
	echo "mkdir -p $GENERAL_LOG"
	
	mkdir -p $MODEM_LOG
	echo "mkdir -p $MODEM_LOG"
	
	mkdir -p $TCP_DUMP_LOG
	echo "mkdir -p $GENERAL_LOG"
}

if [ ".$savelogs_prop" == ".0" ]; then
	echo "savelogs_prop=0 start" >> $LOG_DIR/savelogs_log.txt
	remove_folder
	setprop persist.asus.uts com.asus.removelogs.completed
    setprop persist.asus.savelogs.complete 0
    setprop persist.asus.savelogs.complete 1
	#am broadcast -a "com.asus.removelogs.completed"
	echo "savelogs_prop=0 Done" >> $LOG_DIR/savelogs_log.txt
	chmod 777 $LOG_DIR/savelogs_log.txt	
elif [ ".$savelogs_prop" == ".1" ]; then
	echo "savelogs_prop=1 start" >> $LOG_DIR/savelogs_log.txt
	# check mount file
	umask 0;
	sync
	############################################################################################
	# remove folder
	remove_folder

	# create folder
	create_folder
	
	# save_general_log
	save_general_log
	
	############################################################################################
	# sync data to disk 
	# 1015 sdcard_rw
	chmod -R 777 $GENERAL_LOG
	chmod 777 $LOG_DIR/savelogs_log.txt	
	sync

	dumpstate > $GENERAL_LOG/dumpstate.txt 2>&1
	setprop persist.asus.uts com.asus.savelogs.completed
    setprop persist.asus.savelogs.complete 0
    setprop persist.asus.savelogs.complete 1
	#am broadcast -a "com.asus.savelogs.completed"
 
	echo "savelogs_prop=1 Done" >> $LOG_DIR/savelogs_log.txt
elif [ ".$savelogs_prop" == ".2" ]; then
	echo "savelogs_prop=2 start" >> $LOG_DIR/savelogs_log.txt
	# check mount file
	umask 0;
	sync
	############################################################################################
	# remove folder
	remove_folder

	# create folder
	create_folder
	
	# save_modem_log
	save_modem_log
	
	############################################################################################
	# sync data to disk 
	# 1015 sdcard_rw
	chmod -R 777 $MODEM_LOG
	chmod 777 $LOG_DIR/savelogs_log.txt	
	sync

	setprop persist.asus.uts com.asus.savelogs.completed
    setprop persist.asus.savelogs.complete 0
    setprop persist.asus.savelogs.complete 1
	#am broadcast -a "com.asus.savelogs.completed"
 
	echo "savelogs_prop=2 Done" >> $LOG_DIR/savelogs_log.txt
elif [ ".$savelogs_prop" == ".3" ]; then
	echo "savelogs_prop=3 start" >> $LOG_DIR/savelogs_log.txt
	# check mount file
	umask 0;
	sync
	############################################################################################
	# remove folder
	remove_folder

	# create folder
	create_folder
	
	# save_tcpdump_log
	save_tcpdump_log
	
	############################################################################################
	# sync data to disk 
	# 1015 sdcard_rw
	chmod -R 777 $TCP_DUMP_LOG
	chmod 777 $LOG_DIR/savelogs_log.txt	
	sync

	setprop persist.asus.uts com.asus.savelogs.completed
    setprop persist.asus.savelogs.complete 0
    setprop persist.asus.savelogs.complete 1
	#am broadcast -a "com.asus.savelogs.completed"
 
	echo "savelogs_prop=3 Done" >> $LOG_DIR/savelogs_log.txt
elif [ ".$savelogs_prop" == ".4" ]; then
	echo "savelogs_prop=4 start" >> $LOG_DIR/savelogs_log.txt
	# check mount file
	umask 0;
	sync
	############################################################################################
	# remove folder
	remove_folder

	# create folder
	create_folder
	
	# save_general_log
	save_general_log
	
	# save_modem_log
	save_modem_log
	
	# save_tcpdump_log
	save_tcpdump_log
	
	############################################################################################
	# sync data to disk 
	# 1015 sdcard_rw
	chmod -R 777 $GENERAL_LOG
	chmod -R 777 $MODEM_LOG
	chmod -R 777 $TCP_DUMP_LOG
	chmod 777 $LOG_DIR/savelogs_log.txt
	
	dumpstate > $GENERAL_LOG/dumpstate.txt 2>&1
	setprop persist.asus.uts com.asus.savelogs.completed
    setprop persist.asus.savelogs.complete 0
    setprop persist.asus.savelogs.complete 1
	#am broadcast -a "com.asus.savelogs.completed"
	echo "savelogs_prop=4 Done" >> $LOG_DIR/savelogs_log.txt
fi
