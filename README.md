# Assembly Code Bug: Out-of-Bounds Memory Access

This repository demonstrates a common error in assembly programming: accessing memory outside the allocated bounds.  The bug involves calculating a memory address based on registers and offsets, where an incorrectly large value in one register can cause a segmentation fault.

## Bug Description
The `bug.asm` file contains assembly code that tries to access memory using indexing. A large value in the `ECX` register can cause the calculated address to go beyond allocated memory. The resulting memory access violation causes a segmentation fault, crashing the program.

## Solution
The `bugSolution.asm` file provides a corrected version of the code.  It adds boundary checks to ensure the calculated address is within the safe memory range before accessing it. This prevents the segmentation fault and makes the program more robust.