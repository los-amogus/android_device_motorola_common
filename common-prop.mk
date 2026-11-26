# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Audio (newer CAF HALs)
PRODUCT_ODM_PROPERTIES += \
    persist.vendor.audio.fluence.speaker=false \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicecomm=true \
    persist.vendor.audio.fluence.voicerec=false \
    ro.vendor.audio.sdk.fluencetype=fluence

PRODUCT_PRODUCT_PROPERTIES += \
    ro.audio.monitorRotation=true \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_steps=7

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.asha.central.enabled?=true \
    bluetooth.profile.a2dp.source.enabled?=true \
    bluetooth.profile.avrcp.target.enabled?=true \
    bluetooth.profile.bas.client.enabled?=true \
    bluetooth.profile.gatt.enabled?=true \
    bluetooth.profile.hfp.ag.enabled?=true \
    bluetooth.profile.hid.device.enabled?=true \
    bluetooth.profile.hid.host.enabled?=true \
    bluetooth.profile.map.server.enabled?=true \
    bluetooth.profile.opp.enabled?=true \
    bluetooth.profile.pan.nap.enabled?=true \
    bluetooth.profile.pan.panu.enabled?=true \
    bluetooth.profile.pbap.server.enabled?=true \
    bluetooth.profile.sap.server.enabled?=true \
    bluetooth.server.automatic_turn_on=true \
    persist.bluetooth.bqr.event_mask=14 \
    persist.bluetooth.bqr.min_interval_ms=500

## Set the Bluetooth Class of Device
# Service Field: 0x5A -> 90
#    Bit 17: Networking
#    Bit 19: Capturing
#    Bit 20: Object Transfer
#    Bit 22: Telephony
# MAJOR_CLASS: 0x02 -> 2 (Phone)
# MINOR_CLASS: 0x0C -> 12 (Smart Phone)
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.device.class_of_device=90,2,12

# Camera
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.expose.aux=1

# Charger & Power / Suspend
PRODUCT_PRODUCT_PROPERTIES += \
    ro.charger.enable_suspend=true \
    ro.thermal_warmreset=true \
    suspend.short_suspend_threshold_millis=2000 \
    suspend.short_suspend_backoff_enabled=true \
    suspend.max_sleep_time_millis=40000

# Dex2oat
PRODUCT_VENDOR_PROPERTIES += \
    dalvik.vm.dex2oat64.enabled=true \
    dalvik.vm.dex2oat-threads=6 \
    dalvik.vm.dex2oat-cpu-set=0,1,2,3,4,5,6 \
    dalvik.vm.boot-dex2oat-threads=6 \
    dalvik.vm.background-dex2oat-threads=4 \
    dalvik.vm.image-dex2oat-threads=6

# DRM service
PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# Encryption
## Avoid Adoptable double encryption
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.allow_encrypt_override=true

## Enforce use of new dm-default-key API
PRODUCT_VENDOR_PROPERTIES += \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.options=::v2

# FUSE passthrough
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# Google Assistant
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# Hardware
ifeq ($(PRODUCT_USES_QCOM_HARDWARE),true)
  PRODUCT_VENDOR_PROPERTIES += \
      ro.vendor.hardware=qcom
else
  $(warning QCOM hardware has not been selected!)
  PRODUCT_VENDOR_PROPERTIES += \
      ro.vendor.hardware=unknown
endif

# HFR
ifeq ($(call device-has-characteristic,hfr),true)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
      ro.surface_flinger.set_idle_timer_ms=250 \
      ro.surface_flinger.set_touch_timer_ms=1000 \
      ro.surface_flinger.set_display_power_timer_ms=1000 \
      ro.surface_flinger.use_smart_90_for_video=true \
      ro.surface_flinger.refresh_rate_switching=true
endif

# LMKd
PRODUCT_VENDOR_PROPERTIES += \
    ro.lmk.log_stats=false \
    ro.lmk.thrashing_limit=30 \
    ro.lmk.swap_free_low_percentage=10 \
    ro.lmk.psi_partial_stall_ms=50 \
    ro.lmk.swap_util_max=90 \
    ro.lmk.thrashing_limit_decay=25 \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.kill_timeout_ms=100

# Kernel
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.kernel_version=$(TARGET_KERNEL_VERSION)

# One Handed-Mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# Recovery
PRODUCT_VENDOR_PROPERTIES += \
    ro.recovery.usb.vid=22B8 \
    ro.recovery.usb.adb.pid=2E81 \
    ro.recovery.usb.fastboot.pid=2E81

# RIL
## Enable advanced power saving for data connectivity
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.dpm.tcm=1

## Enable Power save functionality for modem
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.radio.add_power_save=1

## IMS
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.radio.vdp_on_ims_cap=1 \
    persist.vendor.radio.report_codec=1

## Modem properties
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.radio.wait_for_pbm=1 \
    persist.vendor.radio.mt_sms_ack=19 \
    persist.vendor.radio.unicode_op_names=true \
    persist.vendor.radio.oem_socket=true \
    persist.vendor.radio.msgtunnel.start=true

## RemoteFS Storage
# This property is needed for rmt_storage to look for fsg
# in /vendor
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.build.vendorprefix=/vendor

## VoLTE / VT / WFC
PRODUCT_VENDOR_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1

# SurfaceFlinger
PRODUCT_VENDOR_PROPERTIES += \
    ro.surface_flinger.enable_frame_rate_override=false

# USB
PRODUCT_VENDOR_PROPERTIES += \
    vendor.usb.contaminantdisable=true \
    vendor.usb.signalingdisable=true

# Watchdog & Zygote
PRODUCT_PRODUCT_PROPERTIES += \
    framework_watchdog.fatal_window.second=600 \
    framework_watchdog.fatal_count=3 \
    zygote.critical_window.minute=10

# Disable Compressed APEX on 4.14 kernel as Android 12 enforces it and our kernel is not compatible (yet)
ifeq ($(TARGET_KERNEL_VERSION), 4.14)
  OVERRIDE_PRODUCT_COMPRESSED_APEX := false
endif
