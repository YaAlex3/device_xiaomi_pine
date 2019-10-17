#
# Copyright (C) 2019 The LineageOS Project
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
#

# Inherit from the common Open Source configuration.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit from the common LineageOS configuration.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from pine device
$(call inherit-product, device/xiaomi/pine/device.mk)

PRODUCT_DEVICE := pine
PRODUCT_NAME := lineage_pine
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi 7A
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="pine-user 9 PKQ1.190319.001 V10.2.5.0.PCMMIXM release-keys" \
    PRODUCT_NAME="pine" \
    TARGET_DEVICE="pine"

BUILD_FINGERPRINT := Xiaomi/pine/pine:9/PKQ1.190319.001/V10.2.5.0.PCMMIXM:user/release-keys
