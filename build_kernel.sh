#!/bin/bash
# Samsung kernel for universal7420  build script 
#
# By G-Joker v0.2
#
# Device & Variant
#
### Galaxy Note 5 ###
# noblelte = SM-N920
#
# xx = C/CD/G/I (International GSM)
# ktt = K (Korea - KT Corporation)
# lgt = L (Korea - LG Telecom)
# skt = S (Korea - SK Telecom)
# kor = K/L/S (Korea - Unified)
# zc/chn  = 0 (China Duos)
# zh/xtc = 8 (Hongkong / Malaysia）
# spr = P (Sprint)
# usc = R4 (US Cellular)
# tmo = T (T-Mobile)
# bcm = W8 (Canada)
#
### Galaxy S6 Edge+ ###
# zenlte = SM-G928
#            
# xx = 7C/C/CD/F/FD/G/I (International GSM)
# ktt = K (Korea - KT Corporation)
# lgt = L (Korea - LG Telecom)
# skt = S (Korea - SK Telecom)
# kor = K/L/S (Korea - Unified)
# zc/chn  = 0 (China Duos)
# zh = 7 (Hongkong)
# spr = P (Sprint)
# usc = R4 (US Cellular)
# tmo = T (T-Mobile)
# bcm = W8 (Canada)
# 
### Galaxy S6 Edge ###     
# zerolte = SM-G925
#
# xx = F/I (International GSM)
# ktt = K (Korea - KT Corporation)
# lgt = L (Korea - LG Telecom)
# skt = S (Korea - SK Telecom)
# kor = K/L/S (Korea - Unified)
# zc/chn  = 0 (China)
# dcm = D (Japan Docomo)
# kdi = J (Japan AU)
# spr = P (Sprint)
# usc = R4/R7 (US Cellular)
# tmo = T (T-Mobile)
# bcm = W8 (Canada)
#
### Galaxy S6 ###
# zeroflte = SM-G920
#            
# xx = F/FD/I (International GSM)
# ktt = K (Korea - KT Corporation)
# lgt = L (Korea - LG Telecom)
# skt = S (Korea - SK Telecom)
# kor = K/L/S (Korea - Unified)
# zc/chn = 0 (China Duos)
# zm = 8 (China Mobile)
# ctc = 9 (China Telecom) 
# zt = 8 (Taiwan)
# dcm = D (Japan Docomo) 
# spr = P (Sprint)
# usc = R4/R7 (US Cellular)
# tmo = T (T-Mobile)
# bcm = W8 (Canada)
#

export DEVICE=noblelte
export VARIANT=zc
export ARCH=arm64
export TOOLCHAIN=$HOME/toolchain/aarch64-sabermod-7.0
export BUILD_CROSS_COMPILE=$TOOLCHAIN/bin/aarch64-
export BUILD_JOB_NUMBER=`grep processor /proc/cpuinfo|wc -l`

RDIR=$(pwd)
OUTDIR=$RDIR/arch/$ARCH/boot
DTSDIR=$RDIR/arch/$ARCH/boot/dts
DTBDIR=$OUTDIR/dtb
DTCTOOL=$RDIR/scripts/dtc/dtc
INCDIR=$RDIR/include

PAGE_SIZE=2048
DTB_PADDING=0

case $DEVICE in
 noblelte)
 	case $VARIANT in
 	xx)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-noblelte_defconfig
		;;
 	kor|ktt|skt|lgt)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-noblelte_defconfig
		;;
 	zc|chn)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-noblelteopen_defconfig
		;;
 	zh|xtc)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-nobleltezh_defconfig
		;;
 	spr|usc)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-nobleltespr_defconfig
		;;
 	tmo|bcm)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-nobleltetmo_defconfig
		;;
	*)
		echo "Unknown variant: $VARIANT"
		exit 1
		;;
	esac
;;
 zenlte)
 	case $VARIANT in
 	xx)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zenlte_defconfig
		;;
 	kor|ktt|skt|lgt)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zerolte_defconfig
		;;
 	zc|chn)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zenlteopen_defconfig
		;;
 	zh|xtc)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zenltezh_defconfig
		;;
	spr|usc)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zenltespr_defconfig
		;;
 	tmo|bmc)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zeroltetmo_defconfig
		;;
	*)
		echo "Unknown variant: $VARIANT"
		exit 1
		;;
	esac
;;
 zerolte)
	 case $VARIANT in
 	xx)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zerolte_defconfig
		;;
 	kor|ktt|skt|lgt)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zerolte_defconfig
		;;
 	zc|chn)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zerolteopen_defconfig
		;;
	dcm|kdi)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zeroltejpn_defconfig
		;;
 	spr|usc)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zeroltespr_defconfig
		;;
 	tmo|bmc)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zeroltetmo_defconfig
		;;
	*)
		echo "Unknown variant: $VARIANT"
		exit 1
		;;
	esac
;;
 zeroflte)
	 case $VARIANT in
 	xx)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zeroflte_defconfig
		;;
	zt|zm|zc|chn|ctc)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zeroflteopen_defconfig
		;;
 	dcm)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zerofltejpn_defconfig
		;;
 	spr|usc)
		 KERNEL_DEFCONFIG=$DEVICE/exynos7420-zerofltespr_defconfig
		;;
 	tmo|bmc)
 		KERNEL_DEFCONFIG=$DEVICE/exynos7420-zerofltetmo_defconfig
		;;
	*)
		echo "Unknown variant: $VARIANT"
		exit 1
		;;
	esac
;;
*)
	echo "Unknown device: $DEVICE"
	exit 1
	;;
esac

FUNC_CLEAN_DTB()
{
	if ! [ -d $RDIR/arch/$ARCH/boot/dts ] ; then
		echo "no directory : "$RDIR/arch/$ARCH/boot/dts""
	else
		echo "rm files in : "$RDIR/arch/$ARCH/boot/dts/*.dtb""
		rm $RDIR/arch/$ARCH/boot/dts/*.dtb
		rm $RDIR/arch/$ARCH/boot/dtb/*.dtb
	fi
}

FUNC_BUILD_KERNEL()
{
	echo ""
	echo "=================================="
	echo "START : FUNC_BUILD_KERNEL"
	echo "=================================="
	echo ""
	echo "build device="$DEVICE$VARIANT ""
	echo "build config="$KERNEL_DEFCONFIG ""

	make -j$BUILD_JOB_NUMBER ARCH=$ARCH \
			CROSS_COMPILE=$BUILD_CROSS_COMPILE \
			$KERNEL_DEFCONFIG || exit -1

	make -j$BUILD_JOB_NUMBER ARCH=$ARCH \
			CROSS_COMPILE=$BUILD_CROSS_COMPILE || exit -1
	
	echo ""
	echo "================================="
	echo "END   : FUNC_BUILD_KERNEL"
	echo "================================="
	echo ""
}


FUNC_BUILD_DTIMAGE_TARGET()
{
	[ -f "$DTCTOOL" ] || {
		echo "You need to run ./build_kernel.sh first!"
		exit 1
	}

	case $DEVICE in
	noblelte)
		case $VARIANT in
		xx)
		    DTSFILES="exynos7420-noblelte_eur_open_00 exynos7420-noblelte_eur_open_01
				exynos7420-noblelte_eur_open_02 exynos7420-noblelte_eur_open_03
				exynos7420-noblelte_eur_open_04 exynos7420-noblelte_eur_open_05
				exynos7420-noblelte_eur_open_06
				exynos7420-noblelte_eur_open_08 exynos7420-noblelte_eur_open_09"
		 	;;
		kor|ktt|skt|lgt)
		    DTSFILES="exynos7420-noblelte_kor_00 exynos7420-noblelte_kor_01
				exynos7420-noblelte_kor_02 exynos7420-noblelte_kor_03
				exynos7420-noblelte_kor_04
				exynos7420-noblelte_kor_06 exynos7420-noblelte_kor_07
				exynos7420-noblelte_kor_08 exynos7420-noblelte_kor_09"
			;;
		zc|chn)
			DTSFILES="exynos7420-noblelte_chn_mdm_00 exynos7420-noblelte_chn_mdm_01
				exynos7420-noblelte_chn_mdm_02 exynos7420-noblelte_chn_mdm_03
				exynos7420-noblelte_chn_mdm_04
				exynos7420-noblelte_chn_mdm_06 exynos7420-noblelte_chn_mdm_07
				exynos7420-noblelte_chn_mdm_08 exynos7420-noblelte_chn_mdm_09"
			;;
		zh|xtc)
		    DTSFILES="exynos7420-noblelte_sea_xtc_00 exynos7420-noblelte_sea_xtc_01
				exynos7420-noblelte_sea_xtc_02 exynos7420-noblelte_sea_xtc_03
				exynos7420-noblelte_sea_xtc_04 exynos7420-noblelte_sea_xtc_05
				exynos7420-noblelte_sea_xtc_06
				exynos7420-noblelte_sea_xtc_08 exynos7420-noblelte_sea_xtc_09"
			;;	
		spr|usc)
		    DTSFILES="exynos7420-noblelte_usa_cdma_00 exynos7420-noblelte_usa_cdma_01
				exynos7420-noblelte_usa_cdma_02 exynos7420-noblelte_usa_cdma_03
				exynos7420-noblelte_usa_cdma_04
				exynos7420-noblelte_usa_cdma_06 exynos7420-noblelte_usa_cdma_07
				exynos7420-noblelte_usa_cdma_08 exynos7420-noblelte_usa_cdma_09"	
			;;
		tmo|bcm)
		    DTSFILES="exynos7420-noblelte_usa_00 exynos7420-noblelte_usa_01
				exynos7420-noblelte_usa_02 exynos7420-noblelte_usa_03
				exynos7420-noblelte_usa_04
				exynos7420-noblelte_usa_06 exynos7420-noblelte_usa_07
				exynos7420-noblelte_usa_08 exynos7420-noblelte_usa_09"	
			;;
		*)
			echo "Unknown variant: $VARIANT"
			exit 1
			;;
		esac
	;;
	zenlte)
		case $VARIANT in
		xx)
		    DTSFILES="exynos7420-zenlte_eur_open_00 exynos7420-zenlte_eur_open_01
				exynos7420-zenlte_eur_open_02 exynos7420-zenlte_eur_open_03
				exynos7420-zenlte_eur_open_04
				exynos7420-zenlte_eur_open_07 exynos7420-zenlte_eur_open_08
				exynos7420-zenlte_eur_open_09"
		 	;;
		kor|ktt|skt|lgt)
		    DTSFILES="exynos7420-zenlte_kor_00 exynos7420-zenlte_kor_01
				exynos7420-zenlte_kor_02 exynos7420-zenlte_kor_03
				exynos7420-zenlte_kor_04
				exynos7420-zenlte_kor_08 exynos7420-zenlte_kor_09"
			;;
		zc|chn)
			DTSFILES="exynos7420-zenlte_chn_mdm_00 exynos7420-zenlte_chn_mdm_01
				exynos7420-zenlte_chn_mdm_02 exynos7420-zenlte_chn_mdm_03
				exynos7420-zenlte_chn_mdm_04
				exynos7420-zenlte_chn_mdm_08 exynos7420-zenlte_chn_mdm_09"
			;;
		zh)
			DTSFILES="exynos7420-zenlte_chn_03 exynos7420-zenlte_chn_04
				exynos7420-zenlte_chn_08 exynos7420-zenlte_chn_09"
			;;	
		spr|usc)
		    DTSFILES="exynos7420-zenlte_usa_cdma_00 exynos7420-zenlte_usa_cdma_01
				exynos7420-zenlte_usa_cdma_02 exynos7420-zenlte_usa_cdma_03
				exynos7420-zenlte_usa_cdma_04
				exynos7420-zenlte_usa_cdma_08 exynos7420-zenlte_usa_cdma_09"	
			;;
		tmo|bcm)
		    DTSFILES="exynos7420-zenlte_usa_00 exynos7420-zenlte_usa_01
				exynos7420-zenlte_usa_02 exynos7420-zenlte_usa_03
				exynos7420-zenlte_usa_04
				exynos7420-zenlte_usa_08 exynos7420-zenlte_usa_09"	
			;;
		*)
			echo "Unknown variant: $VARIANT"
			exit 1
			;;
		esac
	;;
	zerolte)
		case $VARIANT in
		xx)
			DTSFILES="eexynos7420-zerolte_eur_open_00 exynos7420-zerolte_eur_open_01
				exynos7420-zerolte_eur_open_02 exynos7420-zerolte_eur_open_03
				exynos7420-zerolte_eur_open_04 exynos7420-zerolte_eur_open_05
				exynos7420-zerolte_eur_open_06 exynos7420-zerolte_eur_open_07
				exynos7420-zerolte_eur_open_08"
			;;
 	    kor|ktt|skt|lgt)
 		    DTSFILES="exynos7420-zerolte_kor_00 exynos7420-zerolte_kor_01
				exynos7420-zerolte_kor_02 exynos7420-zerolte_kor_03
				exynos7420-zerolte_kor_04 exynos7420-zerolte_kor_05
				exynos7420-zerolte_kor_06 exynos7420-zerolte_kor_07"
	 	    ;;
		zc|chn)
			DTSFILES="exynos7420-zerolte_chn_00 exynos7420-zerolte_chn_01
				exynos7420-zerolte_chn_02"
			;;
		dcm|kdi)
		    DTSFILES="exynos7420-zerolte_jpn_00 exynos7420-zerolte_jpn_01
				exynos7420-zerolte_jpn_02 exynos7420-zerolte_jpn_03
				exynos7420-zerolte_jpn_04 exynos7420-zerolte_jpn_05
				exynos7420-zerolte_jpn_06"
		    ;;
		spr|usc)
		    DTSFILES="exynos7420-zerolte_usa_cdma_00 exynos7420-zerolte_usa_cdma_01
				exynos7420-zerolte_usa_cdma_02 exynos7420-zerolte_usa_cdma_03
				exynos7420-zerolte_usa_cdma_04 exynos7420-zerolte_usa_cdma_05"	
			;;
		tmo|bcm)
		    DTSFILES="exynos7420-zerolte_usa_00 exynos7420-zerolte_usa_01
				exynos7420-zerolte_usa_02 exynos7420-zerolte_usa_03
				exynos7420-zerolte_usa_04 exynos7420-zerolte_usa_05
				exynos7420-zerolte_usa_06 exynos7420-zerolte_usa_07"	
			;;
		*)
			echo "Unknown variant: $VARIANT"
			exit 1
			;;
		esac
	;;
	zeroflte)
		case $VARIANT in
		xx)
			DTSFILES="exynos7420-zeroflte_eur_open_00 exynos7420-zeroflte_eur_open_01
				exynos7420-zeroflte_eur_open_02 exynos7420-zeroflte_eur_open_03
				exynos7420-zeroflte_eur_open_04 exynos7420-zeroflte_eur_open_05
				exynos7420-zeroflte_eur_open_06 exynos7420-zeroflte_eur_open_07"
			;;
 	    kor|ktt|skt|lgt)
		    DTSFILES="exynos7420-zeroflte_kor_00 exynos7420-zeroflte_kor_01
				exynos7420-zeroflte_kor_02 exynos7420-zeroflte_kor_03
				exynos7420-zeroflte_kor_04 exynos7420-zeroflte_kor_05
				exynos7420-zeroflte_kor_06 exynos7420-zeroflte_kor_07"
		    ;;
		zt|zm|zc|chn|ctc)
			DTSFILES="exynos7420-zeroflte_chn_00 exynos7420-zeroflte_chn_01
				exynos7420-zeroflte_chn_02 exynos7420-zeroflte_chn_03
				exynos7420-zeroflte_chn_04"
			;;
		dcm)
		    DTSFILES="exynos7420-zeroflte_jpn_00 exynos7420-zeroflte_jpn_01
				exynos7420-zeroflte_jpn_02 exynos7420-zeroflte_jpn_03
				exynos7420-zeroflte_jpn_04"
		    ;;
		spr|usc)
		    DTSFILES="exynos7420-zeroflte_usa_cdma_00 exynos7420-zeroflte_usa_cdma_01
				exynos7420-zeroflte_usa_cdma_02 exynos7420-zeroflte_usa_cdma_03"	
			;;
		tmo|bcm)
		    DTSFILES="exynos7420-zeroflte_usa_00 exynos7420-zeroflte_usa_01
				exynos7420-zeroflte_usa_02 exynos7420-zeroflte_usa_03
				exynos7420-zeroflte_usa_04 exynos7420-zeroflte_usa_05"	
			;;
		*)
			echo "Unknown variant: $VARIANT"
			exit 1
			;;
		esac
	;;
	*)
		echo "Unknown device: $DEVICE"
		exit 1
		;;
	esac

	mkdir -p $OUTDIR $DTBDIR

	cd $DTBDIR || {
		echo "Unable to cd to $DTBDIR!"
		exit 1
	}

	rm -f ./*

	echo "Processing dts files..."

	for dts in $DTSFILES; do
		echo "=> Processing: ${dts}.dts"
		${CROSS_COMPILE}cpp -nostdinc -undef -x assembler-with-cpp -I "$INCDIR" "$DTSDIR/${dts}.dts" > "${dts}.dts"
		echo "=> Generating: ${dts}.dtb"
		$DTCTOOL -p $DTB_PADDING -i "$DTSDIR" -O dtb -o "${dts}.dtb" "${dts}.dts"
	done

	echo "Generating dtb.img..."
	$RDIR/scripts/dtbTool/dtbTool -o "$OUTDIR/dtb.img" -d "$DTBDIR/" -s $PAGE_SIZE

	echo "Done."
}

# MAIN FUNCTION
rm -rf ./build.log
(
	START_TIME=`date +%s`

	FUNC_BUILD_KERNEL
	FUNC_CLEAN_DTB
	FUNC_BUILD_DTIMAGE_TARGET

	END_TIME=`date +%s`
	
	let "ELAPSED_TIME=$END_TIME-$START_TIME"
	echo "Total compile time was $ELAPSED_TIME seconds"

) 2>&1	 | tee -a ./build.log

