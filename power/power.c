/*
 * Licensed under the Apache License, Version 2.0.
 */

#define LOG_TAG "PowerHAL-j2y18lte"

#include <cutils/log.h>
#include <cutils/properties.h>
#include <dlfcn.h>
#include <hardware/power.h>
#include <pthread.h>
#include <stdbool.h>
#include <string.h>

#define PERFD_CLIENT "/system/vendor/lib/libqti-perfd-client.so"

enum {
    /* Legacy CPU minimum-frequency resource used by the stock power HAL. */
    STOCK_CPU_MIN_FREQ = 0x020f,
    INTERACTION_DEFAULT_MS = 150,
    LAUNCH_TIMEOUT_MS = 750,
    MAX_BOOST_MS = 1000,
};

static pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
static int (*perf_lock_acq)(int handle, int duration, int *resources, int count);
static int (*perf_lock_rel)(int handle);
static int interaction_handle;
static int launch_handle;
static bool interactive = true;
static bool low_power;

static void init(struct power_module *module __unused)
{
    void *client = dlopen(PERFD_CLIENT, RTLD_NOW | RTLD_LOCAL);
    if (!client) {
        ALOGW("Cannot load stock perfd client: %s", dlerror());
        return;
    }

    perf_lock_acq = dlsym(client, "perf_lock_acq");
    perf_lock_rel = dlsym(client, "perf_lock_rel");
    if (!perf_lock_acq || !perf_lock_rel) {
        ALOGW("Stock perfd client is missing the perf-lock API");
        perf_lock_acq = NULL;
        perf_lock_rel = NULL;
        dlclose(client);
    }
}

static void release_boost(int *handle)
{
    if (*handle > 0)
        perf_lock_rel(*handle);
    *handle = 0;
}

static void boost(int *handle, int duration_ms)
{
    char parsed[PROPERTY_VALUE_MAX];
    int resource = STOCK_CPU_MIN_FREQ;
    int new_handle;

    if (!perf_lock_acq || !interactive || low_power)
        return;

    property_get("sys.post_boot.parsed", parsed, "0");
    if (strcmp(parsed, "1") != 0)
        return;

    if (duration_ms > MAX_BOOST_MS)
        duration_ms = MAX_BOOST_MS;

    new_handle = perf_lock_acq(*handle, duration_ms, &resource, 1);
    if (new_handle <= 0 && *handle > 0)
        new_handle = perf_lock_acq(0, duration_ms, &resource, 1);
    *handle = new_handle > 0 ? new_handle : 0;
}

static void set_interactive(struct power_module *module __unused, int on)
{
    pthread_mutex_lock(&lock);
    interactive = on != 0;
    if (!interactive) {
        release_boost(&interaction_handle);
        release_boost(&launch_handle);
    }
    pthread_mutex_unlock(&lock);
}

static void power_hint(struct power_module *module __unused,
                       power_hint_t hint, void *data)
{
    int value;

    pthread_mutex_lock(&lock);
    switch (hint) {
    case POWER_HINT_INTERACTION:
        value = data ? *(const int *)data : 0;
        boost(&interaction_handle, value > 0 ? value : INTERACTION_DEFAULT_MS);
        break;
    case POWER_HINT_CPU_BOOST:
        value = data ? *(const int *)data : 0;
        if (value > 0)
            boost(&interaction_handle, (value - 1) / 1000 + 1);
        break;
    case POWER_HINT_LAUNCH:
        if (data && *(const int *)data)
            boost(&launch_handle, LAUNCH_TIMEOUT_MS);
        else
            release_boost(&launch_handle);
        break;
    case POWER_HINT_LOW_POWER:
        low_power = data && *(const int *)data;
        if (low_power) {
            release_boost(&interaction_handle);
            release_boost(&launch_handle);
        }
        break;
    default:
        break;
    }
    pthread_mutex_unlock(&lock);
}

static struct hw_module_methods_t methods = {
    .open = NULL,
};

struct power_module HAL_MODULE_INFO_SYM = {
    .common = {
        .tag = HARDWARE_MODULE_TAG,
        .module_api_version = POWER_MODULE_API_VERSION_0_2,
        .hal_api_version = HARDWARE_HAL_API_VERSION,
        .id = POWER_HARDWARE_MODULE_ID,
        .name = "Samsung SM-J250F Power HAL",
        .author = "The LineageOS Project",
        .methods = &methods,
    },
    .init = init,
    .setInteractive = set_interactive,
    .powerHint = power_hint,
};
