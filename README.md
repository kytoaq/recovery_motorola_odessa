<p align="left"> Copyright 2016 - 2021 The LinegeOS Project </p>
<h1 align="left"> TWRP Device configuration for Motorola G9 Plus (odessa) </h1>

<p align="center">
  <img height="600" src="/odessa.jpg?raw=true">
</p>

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core
CHIPSET | Qualcomm Snapdragon 730 (sm6150)
GPU     | Adreno 618
Memory  | 4GB
Shipped Android Version | 10.0 (Android Q)
Storage | 128GB
Battery | 5000 mAh Turbopower (30W)
Dimensions | 170 x 78.1 x 9.7 mm (6.69 x 3.07 x 0.38 in)
Display | LTPS IPS LCD, HDR10 1080 x 2400 pixels, 20:9 ratio (~386 ppi density)
Rear Camera  | 64 MP, f/1.8, 26mm (wide), 1/1.73", 0.8µm, PDAF, 8 MP, f/2.2, 118˚ (ultrawide), 1/4.0", 1.12µm, 2 MP, f/2.2, (macro), 2 MP, f/2.2, (depth)
Front Camera | 16 MP, f/2.0, 29mm (standard)

## Build instructions
- Initialize the source tree -
  ```bash
  repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
  ```
  You may optionally pass `--depth=1` to save space, like so:
  ```bash
  repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
  ```
- Clone this repository -
  ```bash
  git clone https://github.com/kytoaq/recovery_motorola_odessa device/motorola/odessa
  ```

- Clone the kernel repository -
  ```bash
  git clone -b twrp-10 https://github.com/kytoaq/kernel_motorola_sm6150 kernel/motorola/sm6150
  ```

- Build -
  ```bash
  source build/envsetup.sh
  export ALLOW_MISSING_DEPENDENCIES=true
  lunch omni_odessa-eng
  mka recoveryimage -j$(nproc --all)
  ```
- Test build -
  ```bash
  cd out/target/product/odessa
  fastboot boot recovery.img
  ```

If all works, then flash

```bash
  fastboot flash partition recovery recovery.img
```

## Copyright
```bash
 /*
 *  Copyright (C) 2013 - 2021 The OmniROM Project
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
 ```

