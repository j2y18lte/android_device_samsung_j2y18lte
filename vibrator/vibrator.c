/*
 * Copyright (C) 2013 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <hardware/vibrator.h>

#include <errno.h>
#include <fcntl.h>
#include <hardware/vibrator.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

static const char ENABLE_PATH[] = "/sys/class/timed_output/vibrator/enable";

static int set_duration(unsigned int duration_ms)
{
    char value[16];
    int fd;
    int length;
    ssize_t written;
    int result;

    if (duration_ms > INT_MAX)
        return -EINVAL;

    fd = TEMP_FAILURE_RETRY(open(ENABLE_PATH, O_WRONLY | O_CLOEXEC));
    if (fd < 0)
        return -errno;

    length = snprintf(value, sizeof(value), "%u\n", duration_ms);
    written = TEMP_FAILURE_RETRY(write(fd, value, length));
    result = written < 0 ? -errno : (written == length ? 0 : -EIO);
    close(fd);
    return result;
}

static int vibrator_on(vibrator_device_t *device __unused, unsigned int timeout_ms)
{
    return set_duration(timeout_ms);
}

static int vibrator_off(vibrator_device_t *device __unused)
{
    return set_duration(0);
}

static int vibrator_close(hw_device_t *device)
{
    free(device);
    return 0;
}

static int open_vibrator(const hw_module_t *module, const char *id,
                         hw_device_t **device)
{
    vibrator_device_t *vibrator;
    int fd;

    if (!device || !id || strcmp(id, VIBRATOR_DEVICE_ID_MAIN) != 0)
        return -EINVAL;

    *device = NULL;
    fd = TEMP_FAILURE_RETRY(open(ENABLE_PATH, O_WRONLY | O_CLOEXEC));
    if (fd < 0)
        return -errno;
    close(fd);

    vibrator = calloc(1, sizeof(*vibrator));
    if (!vibrator)
        return -ENOMEM;

    vibrator->common.tag = HARDWARE_DEVICE_TAG;
    vibrator->common.version = HARDWARE_DEVICE_API_VERSION(1, 0);
    vibrator->common.module = (hw_module_t *)module;
    vibrator->common.close = vibrator_close;
    vibrator->vibrator_on = vibrator_on;
    vibrator->vibrator_off = vibrator_off;
    *device = &vibrator->common;
    return 0;
}

static struct hw_module_methods_t methods = {
    .open = open_vibrator,
};

struct hw_module_t HAL_MODULE_INFO_SYM = {
    .tag = HARDWARE_MODULE_TAG,
    .module_api_version = VIBRATOR_API_VERSION,
    .hal_api_version = HARDWARE_HAL_API_VERSION,
    .id = VIBRATOR_HARDWARE_MODULE_ID,
    .name = "Samsung SM-J250F Vibrator HAL",
    .author = "The LineageOS Project",
    .methods = &methods,
};
