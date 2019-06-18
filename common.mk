#
# Copyright (C) 2018 The LineageOS Project
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

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/lge/sdm845-common/sdm845-common-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-carbon

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor \
    dtbo \
    vbmeta

#AB_OTA_POSTINSTALL_CONFIG += \
#    RUN_POSTINSTALL_system=true \
#    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
#    FILESYSTEM_TYPE_system=ext4 \
#    POSTINSTALL_OPTIONAL_system=true

#PRODUCT_PACKAGES += \
#    otapreopt_script

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

#GestureHandler
PRODUCT_PACKAGES += \
	GestureHandler
    
# Audio
PRODUCT_PACKAGES += \
    QuadDACPanel \
    audio.a2dp.default
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/QuadDacPanel.rc:system/etc/init/QuadDacPanel.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml

# Boot control
PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    Snap

# Common init scripts
PRODUCT_PACKAGES += \
    init.recovery.judy.rc \
    init.loglevel.rc

# Display
PRODUCT_PACKAGES += \
    libvulkan \
    DisplayMode
    
# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0-java

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-hotword.xml:system/etc/permissions/privapp-permissions-hotword.xml

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Generic.kl:system/usr/keylayout/Generic.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:system/etc/media_profiles_vendor.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service    

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    SecureElement
    
# FM packages
PRODUCT_PACKAGES += \
	libqcomfm_jni \
	android.hardware.broadcastradio@1.0-impl \
	FM2 \
	qcom.fmradio \
	qcom.fmradio.xml

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

# tri-state-key
PRODUCT_PACKAGES += \
    tri-state-key_daemon

# Update engine
PRODUCT_PACKAGES += \
    brillo_update_payload \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm845 \
    libcutils \
    libgptutils \
    libz \

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Wallpapers
#PRODUCT_PACKAGES += \
#    WallpapersBReel2018

#Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/etc/WCNSS_qcom_cfg.ini:/vendor/etc/wifi/WCNSS_qcom_cfg.ini
    
# Properties
-include $(LOCAL_PATH)/system_prop.mk
