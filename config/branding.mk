BUILD_DATE := $(shell date +%Y%m%d)
BUILD_TIME := $(shell date +%H%M)
# Versioning System
# Use signing keys for only official
ifndef EVA_BUILD_TYPE
    EVA_BUILD_TYPE := UNOFFICIAL
endif

ifeq ($(WITH_GAPPS),true)
EVA_ZIP_TYPE := GApps
else
EVA_ZIP_TYPE := Vanilla
endif

# Set all versions
EVA_PROJECT := ProjektEva
EVA_BASE_VERSION := v1.0
EVA_PLATFORM_VERSION := 11
EVA_DEVICE := $(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
EVA_VERSION := $(EVA_PROJECT)-$(EVA_DEVICE)-$(EVA_ZIP_TYPE)-$(BUILD_DATE)-$(BUILD_TIME)-$(EVA_PLATFORM_VERSION)-$(EVA_BASE_VERSION)-$(EVA_BUILD_TYPE)
ROM_FINGERPRINT := $(EVA_PROJECT)/$(PLATFORM_VERSION)/$(EVA_BUILD_TYPE)/$(BUILD_DATE)$(BUILD_TIME)

# Declare it's a EVA build
EVA_BUILD := true
