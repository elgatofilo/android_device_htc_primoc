# Copyright (C) 2012 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm7x30
-include device/htc/msm7x30-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := primoc

# Kernel
BOARD_KERNEL_BASE := 0x14300000
BOARD_KERNEL_PAGE_SIZE := 4096
BOARD_KERNEL_CMDLINE := no_console_suspend=1
TARGET_KERNEL_CONFIG := primoc_defconfig

# WiFi
-include device/htc/msm7x30-common/wifi_bcmdhd.mk

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p17: 00040000 00000200 "misc"
#mmcblk0p21: 0087f400 00000200 "recovery"
#mmcblk0p22: 00400000 00000200 "boot"
#mmcblk0p25: 22dffe00 00000200 "system"
#mmcblk0p27: 12bffe00 00000200 "cache"
#mmcblk0p26: 496ffe00 00000200 "userdata"
#mmcblk0p28: 014bfe00 00000200 "devlog"
#mmcblk0p29: 00040000 00000200 "pdata"

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 4194304
BOARD_RECOVERYIMAGE_PARTITIONSIZE := 8909824
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 585104896
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1232076288
BOARD_FLASH_BLOCK_SIZE := 262144

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Use power button as select in recovery
BOARD_HAS_NO_SELECT_BUTTON := true
