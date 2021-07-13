BUILD_DATE := $(shell date +%Y%m%d)
BUILD_TIME := $(shell date +%H%M)
# Versioning System
# Use signing keys for only official
ifeq ($(EVA_BUILD_TYPE),OFFICIAL)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := ./.keys/releasekey
endif

ifndef EVA_BUILD_TYPE
    EVA_BUILD_TYPE := UNOFFICIAL
endif

# Set all versions
EVA_BASE_VERSION := v4.2
EVA_PLATFORM_VERSION := 11
EVA_VERSION := $(TARGET_PRODUCT)-$(BUILD_DATE)-$(BUILD_TIME)-$(EVA_PLATFORM_VERSION)-$(EVA_BASE_VERSION)-$(EVA_BUILD_TYPE)
ROM_FINGERPRINT := EVAOS/$(PLATFORM_VERSION)/$(EVA_BUILD_TYPE)/$(BUILD_DATE)$(BUILD_TIME)

# Declare it's a EVA build
EVA_BUILD := true
