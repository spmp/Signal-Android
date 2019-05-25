LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# Build etc. if BUILD_SIGNAL defined
ifdef BUILD_SIGNAL
$(info Building Signal)
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := Signal

LOCAL_CERTIFICATE := platform

MY_OUT := $(OUT)/third-party
LOCAL_SRC_FILES := $(MY_OUT)/Signal/Signal/build/outputs/apk/website/debug/Signal-website-arm64-v8a-debug-4.38.2.apk

LOCAL_MODULE_CLASS := APPS
LOCAL_OVERRIDES_PACKAGES := messaging
LOCAL_PRIVILEGED_MODULE := true

LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)

# Setup build environment
# Set TOPDIR if not already
ifdef TOPDIR
MY_TOPDIR := "$(TOPDIR)"
else
MY_TOPDIR := "$(shell pwd)"
endif

# Build defines
MY_JAVA_OPTIONS := "-Xmx40960m -Djava.security.debug=sunpkcs11"

$(info $(shell (_JAVA_OPTIONS=$(MY_JAVA_OPTIONS) ANDROID_HOME="$(MY_TOPDIR)/$(HISTORICAL_SDK_VERSIONS_ROOT)" JAVA_HOME="$(MY_TOPDIR)/$(ANDROID_JAVA8_HOME)" OUT="$(MY_OUT)" GRADLE_USER_HOME="$(GRADLE_USER_HOME)" $(LOCAL_PATH)/./build.sh)))
