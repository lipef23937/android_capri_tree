#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from capri device
$(call inherit-product, device/motorola/capri/device.mk)

PRODUCT_DEVICE := capri
PRODUCT_NAME := twrp_capri
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g(10)
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="capri_retail-user 11 RRBS31.Q1-3-48-22 9edc93 release-keys"

BUILD_FINGERPRINT := motorola/capri_retail/capri:11/RRBS31.Q1-3-48-22/9edc93:user/release-keys
