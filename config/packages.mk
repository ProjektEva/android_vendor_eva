# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# StatiX Packages
PRODUCT_PACKAGES += \
    CustomDoze \
    ThemePicker \
    SimpleDeviceConfig \
    StatiXOSWalls \
    QuickAccessWallet

# Updaters
ifeq ($(EVA_BUILD_TYPE),OFFICIAL)
PRODUCT_PACKAGES += \
    Updater
else ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_PACKAGES += \
    LocalUpdater
endif

PRODUCT_PACKAGES += \
     StatixOverlayStub

# Charger images
PRODUCT_PACKAGES += \
    charger_res_images

-include vendor/eva/config/overlay.mk
