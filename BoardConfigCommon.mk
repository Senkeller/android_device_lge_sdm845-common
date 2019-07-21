
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

BOARD_VENDOR := lge

COMMON_PATH := device/lge/sdm845-common

TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm845
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive androidboot.console=ttyMSM0 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 swiotlb=2048 androidboot.configfs=true androidboot.usbcontroller=a600000.dwc3 firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
NEED_KERNEL_MODULE_SYSTEM := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/lge/sdm845
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

#TARGET_DEVICE_KERNEL_HEADERS := device/lge/sdm845-common/kernel-headers

# Enable real time lockscreen charging current values
#BOARD_GLOBAL_CFLAGS += -DBATTERY_REAL_INFO

# Platform
# TARGET_BOARD_PLATFORM := sdm845
TARGET_BOARD_PLATFORM_GPU := qcom-adreno630

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Treble
BOARD_VNDK_VERSION := current

# ANT+
#BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Audio
BOARD_USES_ALSA_AUDIO := true
USE_XML_AUDIO_POLICY_CONF := 1
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true
AUDIO_FEATURE_ENABLED_USB_TUNNEL := true
AUDIO_FEATURE_ENABLED_CIRRUS_SPKR_PROTECTION := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
AUDIO_FEATURE_FLICKER_SENSOR_INPUT := true
SOUND_TRIGGER_FEATURE_LPMA_ENABLED := true
AUDIO_FEATURE_ENABLED_MAXX_AUDIO := true
AUDIO_FEATURE_ENABLED_24BITS_CAMCORDER := true

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true
TARGET_USES_QTI_CAMERA2CLIENT := true
TARGET_CAMERA_BOOTTIME_TIMESTAMP := true
TARGET_CAMERA_NEEDS_CLIENT_INFO := true
USE_CAMERA_STUB := true
TARGET_USES_AOSP := true
TARGET_USES_MEDIA_EXTENSIONS := false

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true

# FM Radio
BOARD_HAS_QCA_FM_SOC := cherokee
BOARD_HAVE_QCOM_FM := true
SKIP_BOOT_JARS_CHECK := true

# Dex
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true

# Display
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2
TARGET_DISABLE_DISPLAY := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true
TARGET_HAS_WIDE_COLOR_DISPLAY := true
TARGET_HAS_HDR_DISPLAY := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DRM_PP := true

TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := (1 << 21)

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Lineage Hardware
#JAVA_SOURCE_OVERLAYS := \
#    org.lineageos.hardware|$(COMMON_PATH)/lineagehw|**/*.java

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4756340736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 118112366592
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_COPY_OUT_VENDOR := vendor

#BOARD_PREBUILT_VBMETA := $(COMMON_PATH)/vbmeta.img

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
BOARD_SUPPRESS_EMMC_WIPE := true

#TARGET_TAP_TO_WAKE_NODE := /sys/devices/virtual/input/lge_touch/tap2wake

# Extended Filesystem Support
TARGET_EXFAT_DRIVER := sdfat

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_STATE_CTRL_PARAM := "/sys/kernel/boot_wlan/boot_wlan"
WIFI_DRIVER_STATE_OFF := 0
WIFI_DRIVER_STATE_ON := 1
PRODUCT_VENDOR_MOVE_ENABLED := true

# Telephony
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# Sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/private

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/qcom/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += device/qcom/sepolicy/public

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 2

# Inherit from the proprietary version
-include vendor/lge/sdm845-common/BoardConfigVendor.mk
