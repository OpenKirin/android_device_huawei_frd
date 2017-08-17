#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/honor/frd

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HIGH_OPTIMIZATION := true
TARGET_USES_64_BIT_BINDER := true

TARGET_BOARD_PLATFORM := hi3650
BOARD_VENDOR_PLATFORM := hi3650
HISI_TARGET_PRODUCT := hi3650

# Enable CPUSETS
ENABLE_CPUSETS := true

# Enable SCHEDBOOST
ENABLE_SCHEDBOOST := true

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Assert
TARGET_OTA_ASSERT_DEVICE := hi3650,frd,FRD,FRD-L02,FRD-L04,FRD-L09,FRD-L14,FRD-L19

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hi3650
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/vnd_hi3650.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_parameters_ext

# Charger 
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := /sys/class/leds/lcd_backlight0/brightness
HEALTHD_BACKLIGHT_LEVEL := 102

# CMHW
BOARD_HARDWARE_CLASS := \
    $(LOCAL_PATH)/cmhw \
    hardware/cyanogen/cmhw

# Display
USE_OPENGL_RENDERER := true
TARGET_HARDWARE_3D := true
ANDROID_ENABLE_RENDERSCRIPT := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_ION := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true
TARGET_NO_RPC := true

# NFC
TARGET_USES_NQ_NFC := true
BOARD_NFC_CHIPSET := pn548
NXP_CHIP_TYPE := 2

# Kernel
BOARD_KERNEL_BASE := 0x00478000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := loglevel=4 page_tracker=on androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x07588000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64

TARGET_KERNEL_SOURCE := kernel/huawei/hi3650
TARGET_KERNEL_CONFIG := hisi_3650_defconfig

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3154116608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25862078464
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 2097152
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.hi3650
TARGET_RECOVERY_DEVICE_MODULES := libinit_hi3650

# RIL
TARGET_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
BOARD_RIL_CLASS := ../../../device/honor/frd/ril
PROTOBUF_SUPPORTED := true
TARGET_RIL_VARIANT := proprietary

# Enable WEBGL
ENABLE_WEBGL := true

# Vendor
BOARD_NEEDS_VENDORIMAGE_SYMLINK := true
TARGET_COPY_OUT_VENDOR := vendor

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_hi3650
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_frd.cpp

# Sepolicy
BOARD_SEPOLICY_DIRS += \
	device/honor/frd/sepolicy

# Wifi
TARGET_USES_64_BIT_BCMDHD	 := true
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4345
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm43455_hw.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm43455_apsta_hw.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/vendor/firmware/fw_bcm43455_hw.bin"
WIFI_BAND                        := 802_11_ABG

# inherit from the proprietary version
-include vendor/honor/frd/BoardConfigVendor.mk
