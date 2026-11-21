LOCAL_PATH := $(call my-dir)

include $(MOTOROLA_CLEAR_VARS)
LOCAL_MODULE := protobuf_symlinks
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)

MOTOROLA_SYMLINKS += \
    /vendor/lib64/libprotobuf-cpp-full-21.12.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libprotobuf-cpp-full-3.9.1.so \
    /vendor/lib64/libprotobuf-cpp-lite-21.12.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libprotobuf-cpp-lite-3.9.1.so \
    /vendor/lib/libprotobuf-cpp-full-21.12.so:$(TARGET_COPY_OUT_VENDOR)/lib/libprotobuf-cpp-full-3.9.1.so \
    /vendor/lib/libprotobuf-cpp-lite-21.12.so:$(TARGET_COPY_OUT_VENDOR)/lib/libprotobuf-cpp-lite-3.9.1.so
include $(MOTOROLA_BUILD_SYMLINKS)
