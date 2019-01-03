DEVICE_TREE := device/razer/aura

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm845
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true


# Platform
TARGET_BOARD_PLATFORM := sdm845
TARGET_BOARD_PLATFORM_GPU := qcom-adreno630

#Added on other SDM845 devices for crypto support
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4


# Flags
#TARGET_GLOBAL_CFLAGS +=
#TARGET_GLOBAL_CPPFLAGS +=
#COMMON_GLOBAL_CFLAGS +=

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
#TARGET_KERNEL_SOURCE := kernel/razer/sdm845
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := twrp_aura_defconfig
TARGET_PREBUILT_KERNEL := $(DEVICE_TREE)/Image.gz-dtb

# Boot image
#TODO verify Kernel CMDLine
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 androidboot.hardware=qcom androidboot.selinux=permissive
# Verified below from extracted boot.img using Android Kitchen ramdisk_offset needed to be updated
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100

# Partitions
# Updated based off CalebQ42's sizes
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x0004000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0100000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0BAC1D7000
BOARD_FLASH_BLOCK_SIZE := 0x40000

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# A/B device flags
# set to false for recovery only image (source: https://forum.xda-developers.com/showpost.php?p=32965389&postcount=3)
# TARGET_NO_RECOVERY := false
# set to false for recovery only image (source: https://forum.xda-developers.com/showpost.php?p=32965389&postcount=3)
# BOARD_USES_RECOVERY_AS_BOOT := false
# Razer Phone 2 does use system root for image... not sure if this should be set or not though
# BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
# set to on (source: https://forum.xda-developers.com/showpost.php?p=32965389&postcount=3)
# Dees Troy commented all of the above out as part of his work to enable crypto
AB_OTA_UPDATER := true

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file"
TW_BRIGHTNESS_PATH := "/sys/devices/soc/c900000.qcom\x2cmdss_mdp/c900000.qcom\x2cmdss_mdp:qcom\x2cmdss_fb_primary/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 158
TW_SCREEN_BLANK_ON_BOOT := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
BOARD_SUPPRESS_SECURE_ERASE := true
# Stock kernel sometimes crashes when we toggle MTP
TW_EXCLUDE_MTP := true
# Just for building recovery
ALLOW_MISSING_DEPENDENCIES:=true

# We can use the factory reset button combo to enter recovery safely
TW_IGNORE_MISC_WIPE_DATA := true

# exFAT drivers NOT included in stock aura kernel
TW_NO_EXFAT_FUSE := false

# Encryption support
TW_INCLUDE_CRYPTO := true
TARGET_HW_DISK_ENCRYPTION := true
#TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Asian region languages
TW_EXTRA_LANGUAGES := true

# Debug flags
#TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
