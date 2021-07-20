include vendor/eva/build/core/vendor/*.mk

ifeq ($(WITH_GAPPS),true)
$(call inherit-product, vendor/google/gms/config.mk)
$(call inherit-product, vendor/google/pixel/config.mk)
endif

ifeq ($(PRODUCT_USES_QCOM_HARDWARE), true)
include vendor/eva/build/core/ProductConfigQcom.mk
$(call inherit-product-if-exists, device/qcom/common/common.mk)
endif

$(call inherit-product, vendor/qcom/opensource/power/power-vendor-board.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

ifeq ($(TARGET_USES_BLUR), true)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    ro.build.selinux=1

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/eva/build/tools/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/eva/build/tools/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/eva/build/tools/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# copy privapp permissions
PRODUCT_COPY_FILES += \
    vendor/eva/prebuilt/common/etc/permissions/privapp-permissions-eva-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-eva-product.xml \
    vendor/eva/prebuilt/common/etc/permissions/privapp-permissions-eva-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-eva-system.xml

# system mount
PRODUCT_COPY_FILES += \
    vendor/eva/build/tools/system-mount.sh:install/bin/system-mount.sh

# backuptool
PRODUCT_COPY_FILES += \
    vendor/eva/build/tools/backuptool.sh:install/bin/backuptool.sh \
    vendor/eva/build/tools/backuptool.functions:install/bin/backuptool.functions \
    vendor/eva/build/tools/50-eva.sh:system/addon.d/50-eva.sh

# IORap app launch prefetching using Perfetto traces and madvise
PRODUCT_PRODUCT_PROPERTIES += \
    ro.iorapd.enable=true

# eva-specific init file
PRODUCT_COPY_FILES += \
    vendor/eva/prebuilt/common/etc/init.eva.rc:system/etc/init/init.eva.rc

# Build ID
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DISPLAY_ID="$(BUILD_ID)-$(TARGET_BUILD_VARIANT)"

# Packages
include vendor/eva/config/packages.mk

# Branding
include vendor/eva/config/branding.mk

# Bootanimation
include vendor/eva/config/bootanimation.mk

# Fonts
include vendor/eva/config/fonts.mk

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/eva/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/eva/overlay/common
