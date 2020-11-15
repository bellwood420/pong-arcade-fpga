# Arcade Pong(1972) on FPGA
Original arcade version Pong(1972) by Atari implemented on FPGA with external analog circuit. 

![alt text](https://github.com/bellwood420/pong-arcade-fpga/blob/master/image.jpg?raw=true "Image")


# Features

## 1. Synchronous drive

The original circuit consists of so many asynchronous aspects, causing unstability both in routing and running on FPGA.  

To avoid it, I implemented whole circuit synchronously by treating clock signals to registers as datapaths for edge detection,
and driving them by main clock.  

This technique is introduced in the [Reference 1](#References)

## 2. Real paddle input

LMC555 and potentiometer on external circuit provide realistic paddle experience.  

Conversely, you cannnot play without them...😇

## 3. Analog video & sound output

RCA connectors on external circuit output NTSC spec video signal and line level sound signal.  

It would be nice to output video signal from VGA connector on typical FPGA boards, but I'm not good enough to make upscaler. 


# Requirements

## External analog circuit
**You need external analog circuit** other than FPGA board to play the game.
- Schematic availabe: pcb/ext-board/ext-board.pdf
- PCB gerber files available: pcb/ext-board/gerber/
- You can build it on breadboard or use PCB.
- PCB has 40-pins GPIO connector for Terasic FPGA boards and 12-pins Pmod connector for Digilent FPGA boards.

## FPGA board

Example project files available for the boards below:

| Board | Terasic DE0-CV | Digilent Nexys4 DDR |
|:---|:---|:---|
|Chip|Intel/Altera Cyclone V|Xilinx Artix-7|
|IDE version|Quartus Prime Lite Edition 20.1|Vivado 2020.1|
|Start button <br> (COIN_SW)|KEY0|BTNC|
|Connector|GPIO1|Pmod A|


# References
Without the following documents, I would not have been able to finish this project and understand the mystery of a video game built only on discrete logic ICs. 

1. Stephen A. Edwards. Reconstructing Pong on an FPGA. 2012.  
  http://www.cs.columbia.edu/~sedwards/papers/edwards2012reconstructing.pdf
2. Hugo R. Holden. ATARI PONG E CIRCUIT ANALYSIS & LAWN TENNIS: BUILDING A DIGITAL VIDEO GAME WITH 74 SERIES TTL IC’s. 2013.  
  http://worldphaco.com/uploads/LAWN_TENNIS.pdf
