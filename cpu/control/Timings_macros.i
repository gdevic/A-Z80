// This file contains substitute strings for macros used in the Excel timing table and
// is read and processed by genmatrix.py script to generate exec_matrix.i include file.
//
// Format of the file:
//
// A key is prefixed by ':' and corresponds to a spreadsheet column name.
// Each column (key) contains a number of macros, each starting at its own line.
// A macro may span multiple lines, in which case use the '\' character after the name to
// continue on the next line. Multiline macros end when an empty line is reached or when
// a line does not _start_ with a space character.

//-------------------------------------------------------------------
:Function
//-------------------------------------------------------------------
fMFetch
fMRead          fMRead=1;
fMWrite         fMWrite=1;
fIORead         fIORead=1;
fIOWrite        fIOWrite=1;

//-------------------------------------------------------------------
// Basic timings
//-------------------------------------------------------------------
:contM1
1               contM1=1;
:contM2
1               contM2=1;
:nextM
1               nextM=1;
CC
:setM1
1               setM1=1;
SS
CC
E

//-------------------------------------------------------------------
// Various control groups
//-------------------------------------------------------------------
:A:reg_rd
PC
HL
IR
r16
A

:A:reg_wr
PC
IR

:D:reg_rd
A
PC
r8
I

:D:reg_wr
PC
r8

:DB_pads
R
W

//-------------------------------------------------------------------
:Extra
//-------------------------------------------------------------------
Ex_DE_HL        ctl_reg_ex_de_hl=1;
Ex_AF_AF'       ctl_reg_ex_af=1;
EXX             ctl_reg_exx=1;

CCF             ctl_flags_cf_cpl=1;
SCF             ctl_flags_cf_set=1;

HALT            

DI_EI           ctl_iffx_bit=op3;       ctl_iffx_we=1;
IM              ctl_im_sel=op43;        ctl_im_we=1;

IX_IY           ctl_state_iy_set=op5;   ctl_state_ixiy_we=1;
ED              ctl_state_tbl_ed_set=1;
CB              ctl_state_tbl_cb_set=1;
