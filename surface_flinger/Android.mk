LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
include $(LOCAL_PATH)/../Android.common.mk

HYBRIS_PATH := $(LOCAL_PATH)/../../hybris

LOCAL_SRC_FILES:= \
	surface_flinger_compatibility_layer.cpp

LOCAL_MODULE:= libsf_compat_layer
LOCAL_MODULE_TAGS := optional
ifneq ($(strip $(BOARD_HAS_64_BIT_MEDIA_SERVICE)),true)
  LOCAL_32_BIT_ONLY := true
endif

LOCAL_C_INCLUDES := \
	$(HYBRIS_PATH)/include

LOCAL_SHARED_LIBRARIES := \
	libui \
	libutils \
	libgui \
	libEGL \
	libGLESv2

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

HYBRIS_PATH := $(LOCAL_PATH)/../../hybris

LOCAL_SRC_FILES:= \
	direct_sf_test.cpp

LOCAL_MODULE:= direct_sf_test
LOCAL_MODULE_TAGS := optional
ifneq ($(strip $(BOARD_HAS_64_BIT_MEDIA_SERVICE)),true)
  LOCAL_32_BIT_ONLY := true
endif

LOCAL_C_INCLUDES := \
	$(HYBRIS_PATH)/include

LOCAL_SHARED_LIBRARIES := \
	libui \
	libutils \
	libEGL \
	libGLESv2 \
	libsf_compat_layer

include $(BUILD_EXECUTABLE)
