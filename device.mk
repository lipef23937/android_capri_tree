#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#


# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# define hardware platform
PRODUCT_PLATFORM := bengal

LOCAL_PATH := device/motorola/capri

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    vendor \
    system_ext \
    system \
    product

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.bengal \
		otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PACKAGES += \
		android.hardware.boot@1.1-impl-qti.recovery \
		bootctrl.$(PRODUCT_PLATFORM).recovery

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
		    android.hardware.fastboot@1.0-impl-mock \
		    fastbootd

		# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
		    $(LOCAL_PATH)

# Encryption
PRODUCT_PACKAGES += \
		    qcom_decrypt \
		    qcom_decrypt_fbe

# Copy modules for depmod
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/exfat.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/exfat.ko \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/ili9882_mmi.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/ili9882_mmi.ko \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_annotate.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_annotate.ko \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_info.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_info.ko \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/mmi_sys_temp.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/mmi_sys_temp.ko \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/moto_f_usbnet.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/moto_f_usbnet.ko \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/nova_0flash_mmi.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/nova_0flash_mmi.ko \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/qpnp_adaptive_charge.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/qpnp_adaptive_charge.ko \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/qpnp-power-on-mmi.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/qpnp-power-on-mmi.ko \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/sensors_class.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/sensors_class.ko \
$(LOCAL_PATH)/recovery/root/vendor/lib/modules/1.1/utags.ko:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/modules/1.1/utags.ko
