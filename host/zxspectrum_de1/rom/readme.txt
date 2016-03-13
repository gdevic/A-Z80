The "original" ZX Spectrum ROM
==============================
http://www.wearmouth.demon.co.uk/zx82.htm
* "fixed" the NMI bug so the KEY1 which is connected to the NMI pin can be used.
* Added a custom NMI handler that provides a way to enter a POKE for a game by typing
  in the address (5 decimal digits) followed by the value (3 decimal digits)
  after which the value will be stored to the selected location.

The GOSH WONDERFUL ROM
======================
http://www.wearmouth.demon.co.uk/gw03/gw03info.htm

Flash the "combined.bin" into the flash of your DE1 board at the address 0.
SW0 selects which ROM image (which 16K block) is used.

See the User's Guide for more information on this design.

CREATE ROM IMAGES
=================
Run assemble.bat to create ZX Spectrum ROM (rom.bin)
Run this command to append the two images:
copy /b rom.bin + gw03.rom combined.rom
