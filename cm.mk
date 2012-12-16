# Specify phone tech before including full phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := primoc

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/primoc/device_primoc.mk)

# Device naming
PRODUCT_DEVICE := primoc
PRODUCT_NAME := cm_primoc
PRODUCT_BRAND := htc
PRODUCT_MODEL := One V
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primoc BUILD_FINGERPRINT=virgin_mobile/htc_primoc/primoc:4.0.3/IML74K/63812.6:user/release-keys PRIVATE_BUILD_DESC="1.08.652.6 CL63812 release-keys" BUILD_NUMBER=63812
