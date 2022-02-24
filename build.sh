output_path="./output"

export CROSS_COMPILE="/home/danil_e71/tizen/arm-linux-gnueabi/bin/arm-linux-gnueabi-"

export ARCH=arm
export TARGET_ARCH=arm

build_kernel()
{ 
	if [ ! -d "$output_path" ]; then
	   mkdir "$output_path"
	fi

	echo "${output_path}"

	makeflags+=" O=${output_path}"

	#make clean

	make ${makeflags} tizen_serranovelte_defconfig

	make ${makeflags} -j16

	make ${makeflags} -j16 dtbs

	mv output/arch/arm/boot/zImage output/arch/arm/boot/kernel

	./dtbtool -o output/arch/arm/boot/dt.img -p output/scripts/dtc/ -v output/arch/arm/boot/dts/
}

build_kernel

#
