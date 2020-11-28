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
- You can build it on breadboard, universal board or use my PCB.
- PCB has 40-pins GPIO connector for Terasic FPGA boards and 12-pins Pmod connector for Digilent FPGA boards.

## FPGA board

Example project files available for the boards below:

<table>
  <tr>
    <th align="left">Board</th>
    <th align="left">Terasic<br>DE0-CV</th>
    <th align="left">Terasic<br>DE-10 Nano</th>
    <th align="left">Digilent<br>Nexys4 DDR</th>
    <th></th>
  </tr>
  <tr>
    <td>Chip</td>
    <td colspan="2">Intel/Altera Cyclone V</td>
    <td>Xilinx Artix-7</td>
    <td></td>
  </tr>
  <tr>
    <td>IDE version</td>
    <td colspan="2">Quartus Prime Lite Edition 20.1</td>
    <td>Vivado 2020.1</td>
    <td></td>
  </tr>
  <tr>
    <td>Start button<br>(COIN_SW)</td>
    <td colspan="2">KEY0</td>
    <td>BTNC</td>
    <td></td>
  </tr>
  <tr>
    <td>Max point sel<br>(SW1A/SW1B)</td>
    <td colspan="3">SW[0]/SW[1]</td>
    <td>On: 15 pts, Off 11 pts</td>
  </tr>
  <tr>
    <td>Connector</td>
    <td>GPIO1</td>
    <td>GPIO0</td>
    <td>Pmod A</td>
    <td>See schematics or qsf/xdc for details</td>
  </tr>
</table>

# References
Without the following documents, I would not have been able to finish this project and understand the mystery of a video game built only on discrete logic ICs. 

1. Stephen A. Edwards. Reconstructing Pong on an FPGA. 2012.  
  http://www.cs.columbia.edu/~sedwards/papers/edwards2012reconstructing.pdf
2. Hugo R. Holden. ATARI PONG E CIRCUIT ANALYSIS & LAWN TENNIS: BUILDING A DIGITAL VIDEO GAME WITH 74 SERIES TTL IC’s. 2013.  
  http://worldphaco.com/uploads/LAWN_TENNIS.pdf
