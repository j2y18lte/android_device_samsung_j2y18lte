LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := vibrator.j2y18lte
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := vibrator.c
LOCAL_CFLAGS := -Wall -Wextra -Werror

include $(BUILD_SHARED_LIBRARY)
