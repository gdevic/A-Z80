z80_pla_checker
===============
Experiment with the Z80 PLA table! The content of the PLA table is published here:
http://arcfn.com/files/z80-pla-table.html

The master PLA table is in ../resources/z80-pla.txt

Other instruction tables that the tool uses are also in that folder.

This executable application was written in portable C# and it should run
on Windows as well as on Linux OS with a mono support.

On Windows, the project file should build using Visual Studio 2015 or above.
On Linux, the project file should build using a mono xbuild command:
  xbuild /p:TargetFrameworkVersion="v4.5" /p:Configuration=Release
