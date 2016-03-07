This directory contains various tools related to the project:

Arduino
=======
The Arduino Mega firmware to be run with a dongle described at:
http://www.baltazarstudios.com


dongle
======
Scripts and files that run Z80 instructions through the Arduino
dongle to collect timing and functional data.

Some instructions (daa, neg, sbc) have separate simulation scripts
containing functional implementation which is then compared to
the response of a physical Z80 CPU (through the dongle).


z80_pla_checker
===============
A Visual Studio project that loads PLA table and provides interactive
simulation of opcodes and logic responses. The program also generates a
Verilog PLA table source code used in the A-Z80 project.


zmac
====
A handy Z80 assember.
Various assembly source files that test and verify A-Z80 processor.
