#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2022 The LineageOS Project
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

-include device/samsung/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/j2y18lte

# Assert
TARGET_OTA_ASSERT_DEVICE := SM-J250F,j2y18lte

# Kernel
TARGET_KERNEL_CONFIG := j2y18lte_defconfig

# Partition sizes
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 3674210304
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 11643367424
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200

# RIL
TARGET_HAS_DUALSIMS := true

# inherit from the proprietary version
-include vendor/samsung/j2y18lte/BoardConfigVendor.mk
