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

N80XX_COMMON := device/samsung/n80xx-common

PRODUCT_PACKAGE_OVERLAYS := $(N80XX_COMMON)/overlay-common

PRODUCT_AAPT_CONFIG := xlarge mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

# Init files
PRODUCT_COPY_FILES += \
    $(N80XX_COMMON)/rootdir/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
    $(N80XX_COMMON)/rootdir/ueventd.smdk4x12.rc:recovery/root/ueventd.smdk4x12.rc \
    $(N80XX_COMMON)/rootdir/fstab.smdk4x12:root/fstab.smdk4x12 \
    $(N80XX_COMMON)/rootdir/lpm.rc:root/lpm.rc
    
# Recovery
TARGET_RECOVERY_FSTAB := $(N80XX_COMMON)/rootdir/fstab.smdk4x12
RECOVERY_FSTAB_VERSION := 2

# Audio
PRODUCT_COPY_FILES += \
    $(N80XX_COMMON)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(N80XX_COMMON)/configs/tiny_hw.xml:system/etc/sound/n80xx

# Packages
PRODUCT_PACKAGES += \
    camera.exynos4 \
    libsecril-client \
    GalaxyNoteTabSettings \
    TVOutDummy

#Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# IR packages
PRODUCT_PACKAGES += \
    consumerir.smdk4x12
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Set product characteristic to tablet, needed for some ui elements
PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, device/samsung/smdk4412-common/common.mk)

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product, vendor/samsung/n80xx/n80xx-vendor.mk)
