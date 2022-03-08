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

# Inherit framework first
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from tenshi device
$(call inherit-product, device/samsung/j2y18lte/device.mk)

# Inherit from common device
$(call inherit-product, device/samsung/msm8937-common/msm8937.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Set those variables here to overwrite the inherited values.
BOARD_VENDOR := samsung
PRODUCT_DEVICE := j2y18lte
PRODUCT_NAME := lineage_j2y18lte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-J250F
PRODUCT_MANUFACTURER := samsung

# Set product device & name
PRODUCT_BUILD_PROP_OVERRIDES += \
   PRODUCT_NAME=j2y18lte

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=samsung/j2y18lteser/j2y18lte:7.1.1/NMF26X/J250FXWU2ATL1:user/release-keys \
    PRIVATE_BUILD_DESC="j2y18lteser-user 7.1.1 NMF26X J250FXWU2ATL1 release-keys"
