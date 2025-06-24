# BxL Bootloader

A simple yet robust first-version bootloader written in x86 Assembly, designed as the foundational step toward a powerful custom bootloader ecosystem.

## Overview

BxL Bootloader is a minimalistic 16-bit real mode bootloader that:

* Initializes essential CPU registers and memory segments
* Displays an interactive menu via BIOS interrupts
* Accepts keyboard input to navigate options
* Demonstrates structured assembly programming with modular functions

This project marks the beginning of a deeper journey into low-level programming, hardware interfacing, and OS development.

## Features (v1)

* Clean text-based menu interface with options:

  * Show logo
  * Quit
* Screen clearing and cursor management using BIOS services
* Keyboard input handling through BIOS interrupt
* Infinite loop hang state for controlled termination

## Future Plans

BxL aims to evolve into a feature-rich bootloader, with goals including:

* Multistage booting with secondary loaders
* Advanced input/output routines with color and cursor control
* Integration with custom kernel loaders
* Support for multiple filesystems and disk operations
* Enhanced error handling and user feedback
* Possibly develop a tiny OS kernel bootstrapped by BxL

## Building and Running

Requirements:

* NASM assembler
* QEMU emulator (or real hardware with appropriate flashing tools)

```bash
nasm -f bin bxl.asm -o boot.img
qemu-system-x86_64 -drive format=raw,file=boot.img
```

## Contributing

Contributions, feedback, and feature requests are welcome!
Feel free to open issues or pull requests.

## License

This project is released under the MIT License. See LICENSE for details.
