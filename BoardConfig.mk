#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_USES_64_BIT_BINDER := true

# Board
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8937
TARGET_BOARD_PLATFORM := msm8937

# Dex-preopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7824900.sdhci androidboot.usbconfigfs=true androidboot.selinux=permissive androidboot.configfs=true
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 earlycon=msm_hsl_uart,0x78B0000 vmalloc=300M firmware_class.path=/vendor/firmware_mnt/image  loop.max_part=7
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/xiaomi/pine
TARGET_KERNEL_CONFIG := pine-perf_defconfig
TARGET_KERNEL_CLANG_COMPILE := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x4000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x4000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0xc0000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x2573fbe00
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x10000000
BOARD_PERSISTIMAGE_PARTITION_SIZE := 0x2000000
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/twrp.fstab
TARGET_USERIMAGES_USE_EXT4 := true

# Verity
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETA_IMAGE := true

# Inherit proprietary version
-include vendor/xiaomi/pine/BoardConfigVendor.mk
