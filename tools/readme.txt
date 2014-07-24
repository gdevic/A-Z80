This directory contains tools related to various Z80 projects.

dongle
======
The Z80/Arduino dongle used in this project is described here:
http://www.devic.us/hacks/arduino-zilog-z80/

This folder contains the scripts and files that run Z80 instructions
through the dongle and collect timing data.

Some instructions (daa, neg, sbc) have separate simulation scripts
that contain functional implementation which is then compared to
the response of a physical Z80 CPU (through the dongle).


Arduino
=======
Contains the Arduino Mega firmware to be run with a dongle:
http://www.devic.us/hacks/arduino-zilog-z80/


z80_pla_checker
===============
Visual Studio 2010 project that loads PLA table and provides interactive
simulation of opcodes and responses. The program can also generate a
Verilog PLA table source code to be included in the A-Z80 project.


zmac
====
A handy Z80 assember.
