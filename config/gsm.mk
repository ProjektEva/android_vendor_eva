# GSM APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

PRODUCT_COPY_FILES += \
    vendor/eva/prebuilt/common/etc/selective-spn-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/selective-spn-conf.xml

# SIM Toolkit
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver
