# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

ADDITIONAL_BUILD_PROPERTIES += \
    ro.eva.version=$(EVA_BASE_VERSION)-$(EVA_BUILD_TYPE)-$(BUILD_DATE)-$(BUILD_TIME) \
    ro.eva.base.version=$(EVA_BASE_VERSION) \
    ro.mod.version=$(BUILD_ID)-$(BUILD_DATE)-$(EVA_BASE_VERSION) \
    ro.eva.fingerprint=$(ROM_FINGERPRINT) \
    ro.eva.buildtype=$(EVA_BUILD_TYPE) \
    ro.eva.device=$(TARGET_PRODUCT)
