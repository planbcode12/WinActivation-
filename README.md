# WinActivation Premium

[![Batch Script](https://img.shields.io/badge/-Batch%20Script-4D4D4D?style=flat&logo=windows-terminal)](https://en.wikipedia.org/wiki/Batch_file)
[![License](https://img.shields.io/badge/License-Unlicense-lightgrey.svg)](https://unlicense.org/)

> **Disclaimer**: This is NOT my original creation. This is an enhanced wrapper for the activation script from `get.activated.win`.

## Overview

A modernized batch script wrapper that provides:
- One-click Windows 10/11 activation (KMS)
- Office 2016/2019/2021 activation
- Visual improvements and animations
- Activation verification

**Original method**: `irm https://get.activated.win | iex`

## Important Notes

1. This project repackages existing activation methods with:
   - Better user interface
   - Visual feedback
   - Additional convenience features

2. All core activation functionality comes from the original `get.activated.win` service.

3. Use at your own risk - for educational purposes only.

## Features

| Feature          | Description                          |
|-----------------|--------------------------------------|
| Auto-elevation  | Automatically requests admin rights  |
| Visual feedback | Animated spinner during operations   |
| Dual activation | Windows + Office in one click        |
| Verification    | Checks current activation status     |
| Clean UI        | Professional console interface       |

## Usage

1. Download `WinActivation.bat`
2. Right-click -> "Run as administrator"
3. Select your activation option

## Verification Commands

The script includes these native verification methods:
```batch
slmgr /xpr  # Windows activation
cscript //nologo "OSPP.VBS" /dstatus  # Office activation
