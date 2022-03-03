#
# Copyright (C) 2019-2020 The LineageOS Project
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

# Inherit from msm8917-common
$(call inherit-product, device/samsung/msm8917-common/msm8917.mk)

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/camera/L16OL_s5k3p3sx_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/L16OL_s5k3p3sx_module_info.xml \
    $(LOCAL_PATH)/camera/M05QS_imx241_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/M05QS_imx241_module_info.xml \
    $(LOCAL_PATH)/camera/M16QL_s5k3p8sx_ak7372_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/M16QL_s5k3p8sx_ak7372_module_info.xml \
    $(LOCAL_PATH)/camera/M16QL_s5k3p8sx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/M16QL_s5k3p8sx_chromatix.xml \
    $(LOCAL_PATH)/camera/N05QL_s5k5e3yx_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/N05QL_s5k5e3yx_module_info.xml \
    $(LOCAL_PATH)/camera/O16QL_s5k3p8sx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/O16QL_s5k3p8sx_chromatix.xml \
    $(LOCAL_PATH)/camera/O16QL_s5k3p8sx_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/O16QL_s5k3p8sx_module_info.xml \
    $(LOCAL_PATH)/camera/P08QL_s5k4h5yc_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/P08QL_s5k4h5yc_module_info.xml \
    $(LOCAL_PATH)/camera/Q08QL_s5k4h5yc_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Q08QL_s5k4h5yc_module_info.xml \
    $(LOCAL_PATH)/camera/R08QS_imx219_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/R08QS_imx219_module_info.xml \
    $(LOCAL_PATH)/camera/U13OL_s5k3l2xx_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/U13OL_s5k3l2xx_module_info.xml \
    $(LOCAL_PATH)/camera/W13QS_imx258_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/W13QS_imx258_module_info.xml \
    $(LOCAL_PATH)/camera/Y08QF_sr846_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Y08QF_sr846_chromatix.xml \
    $(LOCAL_PATH)/camera/Y08QF_sr846_module_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Y08QF_sr846_module_info.xml \
    $(LOCAL_PATH)/camera/Y13QL_s5k3l2xx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/Y13QL_s5k3l2xx_chromatix.xml \
    $(LOCAL_PATH)/camera/imx214_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx214_chromatix.xml \
    $(LOCAL_PATH)/camera/imx219_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx219_chromatix.xml \
    $(LOCAL_PATH)/camera/imx219_elite_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx219_elite_chromatix.xml \
    $(LOCAL_PATH)/camera/imx230_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx230_chromatix.xml \
    $(LOCAL_PATH)/camera/imx241_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx241_chromatix.xml \
    $(LOCAL_PATH)/camera/imx258_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx258_chromatix.xml \
    $(LOCAL_PATH)/camera/msm8917_camera_j2y18.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8917_camera_j2y18.xml \
    $(LOCAL_PATH)/camera/msm8952_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8952_camera.xml \
    $(LOCAL_PATH)/camera/msm8996_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/msm8996_camera.xml \
    $(LOCAL_PATH)/camera/ov13850_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov13850_chromatix.xml \
    $(LOCAL_PATH)/camera/ov13850_q13v06k_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov13850_q13v06k_chromatix.xml \
    $(LOCAL_PATH)/camera/ov4688_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov4688_chromatix.xml \
    $(LOCAL_PATH)/camera/ov5670_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov5670_chromatix.xml \
    $(LOCAL_PATH)/camera/ov8858_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov8858_chromatix.xml \
    $(LOCAL_PATH)/camera/ov8865_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/ov8865_chromatix.xml \
    $(LOCAL_PATH)/camera/s5k3l2xx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3l2xx_chromatix.xml \
    $(LOCAL_PATH)/camera/s5k3m2xm_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xm_chromatix.xml \
    $(LOCAL_PATH)/camera/s5k3m2xx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3m2xx_chromatix.xml \
    $(LOCAL_PATH)/camera/s5k3p3sx_i16ql_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k3p3sx_i16ql_chromatix.xml \
    $(LOCAL_PATH)/camera/s5k4h5yc_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k4h5yc_chromatix.xml \
    $(LOCAL_PATH)/camera/s5k4h5yc_dw9807_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k4h5yc_dw9807_chromatix.xml \
    $(LOCAL_PATH)/camera/s5k4h5yc_dw9807_chromatix_gta2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k4h5yc_dw9807_chromatix_gta2s.xml \
    $(LOCAL_PATH)/camera/s5k5e3yx_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k5e3yx_chromatix.xml \
    $(LOCAL_PATH)/camera/s5k5e3yx_f2_2_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k5e3yx_f2_2_chromatix.xml \
    $(LOCAL_PATH)/camera/s5k5e3yx_f2_2_chromatix_j3y17.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k5e3yx_f2_2_chromatix_j3y17.xml \
    $(LOCAL_PATH)/camera/sr259_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/sr259_chromatix.xml \
    $(LOCAL_PATH)/camera/sr846_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/sr846_chromatix.xml \

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Soong
PRODUCT_SOONG_NAMESPACES += \
    device/samsung/j2y18lte

# Inherit vendor
$(call inherit-product, vendor/samsung/j2y18lte/j2y18lte-vendor.mk)
