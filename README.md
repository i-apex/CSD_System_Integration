# CSD_System_Integration

## Zybo Zynq Board – Vivado Setup and Sample Verilog Design

This repository documents the setup and verification of the *Zybo Zynq-7000 board* using the *Xilinx Vivado Design Suite*. It includes board specifications, tool setup instructions, a sample Verilog project, and verification steps.

---

## 📌 Board Specifications

- *Board Name*: Zybo Z7 (Z7-10 or Z7-20)
- *FPGA Device*: Xilinx Zynq-7000 SoC  
  - Z7-10 → Zynq-7010 (xc7z010clg400-1)  
  - Z7-20 → Zynq-7020 (xc7z020clg400-1)
- *Processor*: Dual-core ARM Cortex-A9 (Processing System)
- *Programmable Logic*: FPGA fabric
- *Clock*: 125 MHz system clock
- *Peripherals*: HDMI, DDR3, Ethernet, USB, PMOD connectors, LEDs, Switches

Reference: [Digilent Zybo Z7 Documentation](https://digilent.com/reference/programmable-logic/zybo-z7/start)

---

## ⚙ Vivado Tool Setup

1. *Install Vivado*  
   - Download [Vivado Design Suite](https://www.xilinx.com/support/download.html)  
   - WebPACK edition is free and supports Zybo Zynq boards  
   - During installation, select *Zynq-7000 SoC* support  

2. *Install Digilent Board Files*  
   - Clone board files:  
     bash
     git clone https://github.com/Digilent/vivado-boards.git
     
   - Copy Zybo Z7 files into:
     
     <Vivado Install Dir>/data/boards/board_files/
     

3. *Create a New Project*  
   - Open Vivado → Create Project → RTL Project  
   - Select *Zybo Z7-10* or *Zybo Z7-20* board  
   - Choose *Verilog* as design language  

---
