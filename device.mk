#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lge/caymanlm

DEVICE_NAME := caymanlm

# Inherit from the common device configuration.
$(call inherit-product, device/lge/sm7250-common/sm7250-common.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.lge \
    sensors.lge

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

$(call soong_config_set,LGE_FINGERPRINT_HAL,TARGET_HAS_EGISTEC_UDFPS,true)

# Overlays
PRODUCT_PACKAGES += \
    ApertureOverlayCaymanlm \
    FrameworksResOverlayCaymanlm \
    SettingsOverlayCaymanlm \
    SystemUIOverlayCaymanlm

# Soong namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from vendor makefiles.
$(call inherit-product, vendor/lge/caymanlm/caymanlm-vendor.mk)
