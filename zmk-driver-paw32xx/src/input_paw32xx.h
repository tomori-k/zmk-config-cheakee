/*
 * Copyright 2024 Google LLC
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef ZEPHYR_INCLUDE_INPUT_PAW32XX_H_
#define ZEPHYR_INCLUDE_INPUT_PAW32XX_H_

/**
 * @brief Set resolution on a paw32xx device
 *
 * @param dev paw32xx device.
 * @param res_cpi CPI resolution, 200 to 3200.
 */
int paw32xx_set_resolution(const struct device *dev, uint16_t res_cpi);

/**
 * @brief Set force awake mode on a paw32xx device
 *
 * @param dev paw32xx device.
 * @param enable whether to enable or disable force awake mode.
 */
int paw32xx_force_awake(const struct device *dev, bool enable);

// 欠けてたので追加した↓

/**
 * @brief Sign extend an 8, 16 or 32 bit value using the index bit as sign bit.
 *
 * @param value The value to sign expand.
 * @param index 0 based bit index to sign bit (0 to 31)
 */
 static inline int32_t sign_extend(uint32_t value, uint8_t index)
 {
     __ASSERT_NO_MSG(index <= 31);
 
     uint8_t shift = 31 - index;
 
     return (int32_t)(value << shift) >> shift;
 }

#endif /* ZEPHYR_INCLUDE_INPUT_PAW32XX_H_ */