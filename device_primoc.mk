#
# Copyright (C) 2012 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/primoc/overlay

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/htc/primoc/ramdisk/fstab.primoc:root/fstab.primoc \
    device/htc/primoc/ramdisk/init.primoc.rc:root/init.primoc.rc \
    device/htc/primoc/ramdisk/init.primoc.usb.rc:root/init.primoc.usb.rc \
    device/htc/primoc/ramdisk/ueventd.primoc.rc:root/ueventd.primoc.rc

# Vold
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Keylayouts and keychars
PRODUCT_COPY_FILES += \
    device/htc/primoc/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/primoc/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/primoc/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/primoc/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/htc/primoc/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/htc/primoc/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/primoc/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/primoc/keylayout/primoc-keypad.kl:system/usr/keylayout/primoc-keypad.kl \
    device/htc/primoc/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/primoc/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/primoc/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    device/htc/primoc/idc/primoc-keypad.idc:system/usr/idc/primoc-keypad.idc \
    device/htc/primoc/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/primoc/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/primoc/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Sensors
PRODUCT_PACKAGES += \
    sensors.primoc

# Carrier Info
CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490

# Property Overides for carrier
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# HTC audio settings
$(call inherit-product, device/htc/primoc/media_a1026.mk)
$(call inherit-product, device/htc/primoc/media_htcaudio.mk)

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/primoc/primoc-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := primoc
PRODUCT_NAME := primoc
PRODUCT_BRAND := htc
PRODUCT_MODEL := One V
PRODUCT_MANUFACTURER := HTC
