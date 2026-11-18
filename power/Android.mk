LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := power.j2y18lte
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := power.c
LOCAL_SHARED_LIBRARIES := libcutils libdl liblog
LOCAL_CFLAGS := -Wall -Wextra -Werror

include $(BUILD_SHARED_LIBRARY)
