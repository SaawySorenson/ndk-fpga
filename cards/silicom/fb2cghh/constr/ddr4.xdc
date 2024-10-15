# ddr4.xdc
# Copyright (C) 2022 CESNET z.s.p.o.
# Author(s): David Beneš <xbenes52@vutbr.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

# DDR4A interface
# Internal Clocks
set_property PACKAGE_PIN AU32 [get_ports {REFCLKA_DDR4_N}]
set_property PACKAGE_PIN AT32 [get_ports {REFCLKA_DDR4_P}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports [list REFCLKA_DDR4_*]]
create_clock -period 3.750 [get_ports  REFCLKA_DDR4_P]

#General Pins
set_property PACKAGE_PIN AR21 [get_ports {DDR4A_A[0]}]
set_property PACKAGE_PIN AV22 [get_ports {DDR4A_A[1]}]
set_property PACKAGE_PIN AP23 [get_ports {DDR4A_A[2]}]
set_property PACKAGE_PIN AK23 [get_ports {DDR4A_A[3]}]
set_property PACKAGE_PIN AT21 [get_ports {DDR4A_A[4]}]
set_property PACKAGE_PIN AV23 [get_ports {DDR4A_A[5]}]
set_property PACKAGE_PIN BB23 [get_ports {DDR4A_A[6]}]
set_property PACKAGE_PIN AT24 [get_ports {DDR4A_A[7]}]
set_property PACKAGE_PIN AW24 [get_ports {DDR4A_A[8]}]
set_property PACKAGE_PIN AU24 [get_ports {DDR4A_A[9]}]
set_property PACKAGE_PIN AV21 [get_ports {DDR4A_A[10]}]
set_property PACKAGE_PIN AY24 [get_ports {DDR4A_A[11]}]
set_property PACKAGE_PIN AL22 [get_ports {DDR4A_A[12]}]
set_property PACKAGE_PIN AT22 [get_ports {DDR4A_A[13]}]
set_property PACKAGE_PIN AY21 [get_ports {DDR4A_A[14]}]
set_property PACKAGE_PIN BA22 [get_ports {DDR4A_A[15]}]
set_property PACKAGE_PIN BB25 [get_ports {DDR4A_A[16]}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4A_A[*]]

set_property PACKAGE_PIN BB22 [get_ports {DDR4A_BA[0]}]
set_property PACKAGE_PIN AW23 [get_ports {DDR4A_BA[1]}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4A_BA[*]]

set_property PACKAGE_PIN AY22 [get_ports {DDR4A_CKE}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4A_CKE[*]]

set_property PACKAGE_PIN ba25 [get_ports {DDR4A_CS_N}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4A_CS_N]

set_property PACKAGE_PIN AR14 [get_ports {DDR4A_LDM[0]}]
set_property PACKAGE_PIN AY16 [get_ports {DDR4A_LDM[1]}]
set_property PACKAGE_PIN BA20 [get_ports {DDR4A_LDM[2]}]
set_property PACKAGE_PIN AN23 [get_ports {DDR4A_LDM[3]}]
set_property PACKAGE_PIN AK22 [get_ports {DDR4A_LDM[4]}]
set_property IOSTANDARD POD12_DCI [get_ports DDR4A_LDM[*]]

set_property PACKAGE_PIN AK18 [get_ports {DDR4A_UDM[0]}]
set_property PACKAGE_PIN AV15 [get_ports {DDR4A_UDM[1]}]
set_property PACKAGE_PIN AP19 [get_ports {DDR4A_UDM[2]}]
set_property PACKAGE_PIN AT20 [get_ports {DDR4A_UDM[3]}]
set_property IOSTANDARD POD12_DCI [get_ports DDR4A_UDM[*]]

set_property PACKAGE_PIN AR12 [get_ports {DDR4A_DQ[0]}]
set_property PACKAGE_PIN AP15 [get_ports {DDR4A_DQ[1]}]
set_property PACKAGE_PIN AP13 [get_ports {DDR4A_DQ[2]}]
set_property PACKAGE_PIN AM14 [get_ports {DDR4A_DQ[3]}]
set_property PACKAGE_PIN AT12 [get_ports {DDR4A_DQ[4]}]
set_property PACKAGE_PIN AM15 [get_ports {DDR4A_DQ[5]}]
set_property PACKAGE_PIN AR13 [get_ports {DDR4A_DQ[6]}]
set_property PACKAGE_PIN AP14 [get_ports {DDR4A_DQ[7]}]
set_property PACKAGE_PIN AK19 [get_ports {DDR4A_DQ[8]}]
set_property PACKAGE_PIN AH17 [get_ports {DDR4A_DQ[9]}]
set_property PACKAGE_PIN AM17 [get_ports {DDR4A_DQ[10]}]
set_property PACKAGE_PIN AJ16 [get_ports {DDR4A_DQ[11]}]
set_property PACKAGE_PIN AL19 [get_ports {DDR4A_DQ[12]}]
set_property PACKAGE_PIN AH16 [get_ports {DDR4A_DQ[13]}]
set_property PACKAGE_PIN AL17 [get_ports {DDR4A_DQ[14]}]
set_property PACKAGE_PIN AK16 [get_ports {DDR4A_DQ[15]}]
set_property PACKAGE_PIN BB14 [get_ports {DDR4A_DQ[16]}]
set_property PACKAGE_PIN BA14 [get_ports {DDR4A_DQ[17]}]
set_property PACKAGE_PIN BB13 [get_ports {DDR4A_DQ[18]}]
set_property PACKAGE_PIN BA15 [get_ports {DDR4A_DQ[19]}]
set_property PACKAGE_PIN BB15 [get_ports {DDR4A_DQ[20]}]
set_property PACKAGE_PIN AY14 [get_ports {DDR4A_DQ[21]}]
set_property PACKAGE_PIN BB12 [get_ports {DDR4A_DQ[22]}]
set_property PACKAGE_PIN AY13 [get_ports {DDR4A_DQ[23]}]
set_property PACKAGE_PIN AW13 [get_ports {DDR4A_DQ[24]}]
set_property PACKAGE_PIN AU15 [get_ports {DDR4A_DQ[25]}]
set_property PACKAGE_PIN AV13 [get_ports {DDR4A_DQ[26]}]
set_property PACKAGE_PIN AU14 [get_ports {DDR4A_DQ[27]}]
set_property PACKAGE_PIN AW14 [get_ports {DDR4A_DQ[28]}]
set_property PACKAGE_PIN AT15 [get_ports {DDR4A_DQ[29]}]
set_property PACKAGE_PIN AU13 [get_ports {DDR4A_DQ[30]}]
set_property PACKAGE_PIN AT16 [get_ports {DDR4A_DQ[31]}]
set_property PACKAGE_PIN AY19 [get_ports {DDR4A_DQ[32]}]
set_property PACKAGE_PIN BA19 [get_ports {DDR4A_DQ[33]}]
set_property PACKAGE_PIN BB19 [get_ports {DDR4A_DQ[34]}]
set_property PACKAGE_PIN BB17 [get_ports {DDR4A_DQ[35]}]
set_property PACKAGE_PIN AW19 [get_ports {DDR4A_DQ[36]}]
set_property PACKAGE_PIN AY18 [get_ports {DDR4A_DQ[37]}]
set_property PACKAGE_PIN BB18 [get_ports {DDR4A_DQ[38]}]
set_property PACKAGE_PIN AW18 [get_ports {DDR4A_DQ[39]}]
set_property PACKAGE_PIN AL20 [get_ports {DDR4A_DQ[40]}]
set_property PACKAGE_PIN AN17 [get_ports {DDR4A_DQ[41]}]
set_property PACKAGE_PIN AP20 [get_ports {DDR4A_DQ[42]}]
set_property PACKAGE_PIN AN18 [get_ports {DDR4A_DQ[43]}]
set_property PACKAGE_PIN AN20 [get_ports {DDR4A_DQ[44]}]
set_property PACKAGE_PIN AN16 [get_ports {DDR4A_DQ[45]}]
set_property PACKAGE_PIN AM20 [get_ports {DDR4A_DQ[46]}]
set_property PACKAGE_PIN AP16 [get_ports {DDR4A_DQ[47]}]
set_property PACKAGE_PIN AM23 [get_ports {DDR4A_DQ[48]}]
set_property PACKAGE_PIN AR24 [get_ports {DDR4A_DQ[49]}]
set_property PACKAGE_PIN AP24 [get_ports {DDR4A_DQ[50]}]
set_property PACKAGE_PIN AR23 [get_ports {DDR4A_DQ[51]}]
set_property PACKAGE_PIN AM22 [get_ports {DDR4A_DQ[52]}]
set_property PACKAGE_PIN AN22 [get_ports {DDR4A_DQ[53]}]
set_property PACKAGE_PIN AM24 [get_ports {DDR4A_DQ[54]}]
set_property PACKAGE_PIN AR22 [get_ports {DDR4A_DQ[55]}]
set_property PACKAGE_PIN AR19 [get_ports {DDR4A_DQ[56]}]
set_property PACKAGE_PIN AU18 [get_ports {DDR4A_DQ[57]}]
set_property PACKAGE_PIN AR18 [get_ports {DDR4A_DQ[58]}]
set_property PACKAGE_PIN AU19 [get_ports {DDR4A_DQ[59]}]
set_property PACKAGE_PIN AU17 [get_ports {DDR4A_DQ[60]}]
set_property PACKAGE_PIN AV18 [get_ports {DDR4A_DQ[61]}]
set_property PACKAGE_PIN AT19 [get_ports {DDR4A_DQ[62]}]
set_property PACKAGE_PIN AV17 [get_ports {DDR4A_DQ[63]}]
set_property PACKAGE_PIN AH22 [get_ports {DDR4A_DQ[64]}]
set_property PACKAGE_PIN AK24 [get_ports {DDR4A_DQ[65]}]
set_property PACKAGE_PIN AJ23 [get_ports {DDR4A_DQ[66]}]
set_property PACKAGE_PIN AJ24 [get_ports {DDR4A_DQ[67]}]
set_property PACKAGE_PIN AJ21 [get_ports {DDR4A_DQ[68]}]
set_property PACKAGE_PIN AL24 [get_ports {DDR4A_DQ[69]}]
set_property PACKAGE_PIN AH21 [get_ports {DDR4A_DQ[70]}]
set_property PACKAGE_PIN AK21 [get_ports {DDR4A_DQ[71]}]
set_property IOSTANDARD POD12_DCI [get_ports DDR4A_DQ[*]]

set_property PACKAGE_PIN AN12 [get_ports {DDR4A_LDQS_N[0]}]
set_property PACKAGE_PIN BA12 [get_ports {DDR4A_LDQS_N[1]}]
set_property PACKAGE_PIN BA17 [get_ports {DDR4A_LDQS_N[2]}]
set_property PACKAGE_PIN AP21 [get_ports {DDR4A_LDQS_N[3]}]
set_property PACKAGE_PIN AJ20 [get_ports {DDR4A_LDQS_N[4]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports DDR4A_LDQS_N[*]]

set_property PACKAGE_PIN AN13 [get_ports {DDR4A_LDQS_P[0]}]
set_property PACKAGE_PIN AY12 [get_ports {DDR4A_LDQS_P[1]}]
set_property PACKAGE_PIN AY17 [get_ports {DDR4A_LDQS_P[2]}]
set_property PACKAGE_PIN AN21 [get_ports {DDR4A_LDQS_P[3]}]
set_property PACKAGE_PIN AH20 [get_ports {DDR4A_LDQS_P[4]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports DDR4A_LDQS_P[*]]

set_property PACKAGE_PIN AJ18 [get_ports {DDR4A_UDQS_N[0]}]
set_property PACKAGE_PIN AV12 [get_ports {DDR4A_UDQS_N[1]}]
set_property PACKAGE_PIN AM18 [get_ports {DDR4A_UDQS_N[2]}]
set_property PACKAGE_PIN AT17 [get_ports {DDR4A_UDQS_N[3]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports DDR4A_UDQS_N[*]]

set_property PACKAGE_PIN AJ19 [get_ports {DDR4A_UDQS_P[0]}]
set_property PACKAGE_PIN AU12 [get_ports {DDR4A_UDQS_P[1]}]
set_property PACKAGE_PIN AM19 [get_ports {DDR4A_UDQS_P[2]}]
set_property PACKAGE_PIN AR17 [get_ports {DDR4A_UDQS_P[3]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports DDR4A_UDQS_P[*]]

set_property PACKAGE_PIN AY23 [get_ports {DDR4A_ODT}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4A_ODT*]

set_property PACKAGE_PIN BA21 [get_ports {DDR4A_BG[0]}]
set_property PACKAGE_PIN AL21 [get_ports {DDR4A_BG[1]}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4A_BG[*]]

set_property PACKAGE_PIN AV20 [get_ports {DDR4A_RESET_N}]
set_property IOSTANDARD LVCMOS12 [get_ports DDR4A_RESET_N]
set_property DRIVE 8 [get_ports DDR4A_RESET_N]

set_property PACKAGE_PIN AW21 [get_ports {DDR4A_ACT_N}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4A_ACT_N]

set_property PACKAGE_PIN BB24 [get_ports {DDR4A_CK_N}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports DDR4A_CK_N[*]]

set_property PACKAGE_PIN BA24 [get_ports {DDR4A_CK_P}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports DDR4A_CK_P[*]]

# DDR4B interface
# Internal Clocks
set_property PACKAGE_PIN G29 [get_ports {REFCLKB_DDR4_N}]
set_property PACKAGE_PIN G28 [get_ports {REFCLKB_DDR4_P}]
set_property IOSTANDARD DIFF_SSTL12 [get_ports [list REFCLKB_DDR4_*]]
create_clock -period 3.750 [get_ports  REFCLKB_DDR4_P]

#General Pins
set_property PACKAGE_PIN J24 [get_ports {DDR4B_A[0]}]
set_property PACKAGE_PIN G24 [get_ports {DDR4B_A[1]}]
set_property PACKAGE_PIN K26 [get_ports {DDR4B_A[2]}]
set_property PACKAGE_PIN E25 [get_ports {DDR4B_A[3]}]
set_property PACKAGE_PIN G23 [get_ports {DDR4B_A[4]}]
set_property PACKAGE_PIN G26 [get_ports {DDR4B_A[5]}]
set_property PACKAGE_PIN J25 [get_ports {DDR4B_A[6]}]
set_property PACKAGE_PIN H25 [get_ports {DDR4B_A[7]}]
set_property PACKAGE_PIN K25 [get_ports {DDR4B_A[8]}]
set_property PACKAGE_PIN H24 [get_ports {DDR4B_A[9]}]
set_property PACKAGE_PIN F23 [get_ports {DDR4B_A[10]}]
set_property PACKAGE_PIN J27 [get_ports {DDR4B_A[11]}]
set_property PACKAGE_PIN F26 [get_ports {DDR4B_A[12]}]
set_property PACKAGE_PIN H27 [get_ports {DDR4B_A[13]}]
set_property PACKAGE_PIN F25 [get_ports {DDR4B_A[14]}]
set_property PACKAGE_PIN B22 [get_ports {DDR4B_A[15]}]
set_property PACKAGE_PIN G27 [get_ports {DDR4B_A[16]}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4B_A[*]]

set_property PACKAGE_PIN J23 [get_ports {DDR4B_BA[0]}]
set_property PACKAGE_PIN D25 [get_ports {DDR4B_BA[1]}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4B_BA[*]]

set_property PACKAGE_PIN D23 [get_ports {DDR4B_CKE}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4B_CKE[*]]

set_property PACKAGE_PIN B27 [get_ports {DDR4B_CS_N}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4B_CS_N]

set_property PACKAGE_PIN N16 [get_ports {DDR4B_LDM[0]}]
set_property PACKAGE_PIN K17 [get_ports {DDR4B_LDM[1]}]
set_property PACKAGE_PIN B18 [get_ports {DDR4B_LDM[2]}]
set_property PACKAGE_PIN C27 [get_ports {DDR4B_LDM[3]}]
set_property PACKAGE_PIN F21 [get_ports {DDR4B_LDM[4]}]
set_property IOSTANDARD POD12_DCI [get_ports DDR4B_LDM[*]]

set_property PACKAGE_PIN F15 [get_ports {DDR4B_UDM[0]}]
set_property PACKAGE_PIN B14 [get_ports {DDR4B_UDM[1]}]
set_property PACKAGE_PIN L20 [get_ports {DDR4B_UDM[2]}]
set_property PACKAGE_PIN M19 [get_ports {DDR4B_UDM[3]}]
set_property IOSTANDARD POD12_DCI [get_ports DDR4B_UDM[*]]

set_property PACKAGE_PIN P12 [get_ports {DDR4B_DQ[0]}]
set_property PACKAGE_PIN M14 [get_ports {DDR4B_DQ[1]}]
set_property PACKAGE_PIN P13 [get_ports {DDR4B_DQ[2]}]
set_property PACKAGE_PIN N12 [get_ports {DDR4B_DQ[3]}]
set_property PACKAGE_PIN N15 [get_ports {DDR4B_DQ[4]}]
set_property PACKAGE_PIN M12 [get_ports {DDR4B_DQ[5]}]
set_property PACKAGE_PIN P15 [get_ports {DDR4B_DQ[6]}]
set_property PACKAGE_PIN M13 [get_ports {DDR4B_DQ[7]}]
set_property PACKAGE_PIN G17 [get_ports {DDR4B_DQ[8]}]
set_property PACKAGE_PIN E16 [get_ports {DDR4B_DQ[9]}]
set_property PACKAGE_PIN G16 [get_ports {DDR4B_DQ[10]}]
set_property PACKAGE_PIN F18 [get_ports {DDR4B_DQ[11]}]
set_property PACKAGE_PIN H17 [get_ports {DDR4B_DQ[12]}]
set_property PACKAGE_PIN E17 [get_ports {DDR4B_DQ[13]}]
set_property PACKAGE_PIN F16 [get_ports {DDR4B_DQ[14]}]
set_property PACKAGE_PIN E18 [get_ports {DDR4B_DQ[15]}]
set_property PACKAGE_PIN K16 [get_ports {DDR4B_DQ[16]}]
set_property PACKAGE_PIN H14 [get_ports {DDR4B_DQ[17]}]
set_property PACKAGE_PIN K15 [get_ports {DDR4B_DQ[18]}]
set_property PACKAGE_PIN J14 [get_ports {DDR4B_DQ[19]}]
set_property PACKAGE_PIN L16 [get_ports {DDR4B_DQ[20]}]
set_property PACKAGE_PIN H15 [get_ports {DDR4B_DQ[21]}]
set_property PACKAGE_PIN J15 [get_ports {DDR4B_DQ[22]}]
set_property PACKAGE_PIN H16 [get_ports {DDR4B_DQ[23]}]
set_property PACKAGE_PIN D17 [get_ports {DDR4B_DQ[24]}]
set_property PACKAGE_PIN A16 [get_ports {DDR4B_DQ[25]}]
set_property PACKAGE_PIN D18 [get_ports {DDR4B_DQ[26]}]
set_property PACKAGE_PIN A15 [get_ports {DDR4B_DQ[27]}]
set_property PACKAGE_PIN D15 [get_ports {DDR4B_DQ[28]}]
set_property PACKAGE_PIN C17 [get_ports {DDR4B_DQ[29]}]
set_property PACKAGE_PIN C15 [get_ports {DDR4B_DQ[30]}]
set_property PACKAGE_PIN B17 [get_ports {DDR4B_DQ[31]}]
set_property PACKAGE_PIN B19 [get_ports {DDR4B_DQ[32]}]
set_property PACKAGE_PIN C21 [get_ports {DDR4B_DQ[33]}]
set_property PACKAGE_PIN A19 [get_ports {DDR4B_DQ[34]}]
set_property PACKAGE_PIN A21 [get_ports {DDR4B_DQ[35]}]
set_property PACKAGE_PIN D19 [get_ports {DDR4B_DQ[36]}]
set_property PACKAGE_PIN B21 [get_ports {DDR4B_DQ[37]}]
set_property PACKAGE_PIN A20 [get_ports {DDR4B_DQ[38]}]
set_property PACKAGE_PIN D20 [get_ports {DDR4B_DQ[39]}]
set_property PACKAGE_PIN H19 [get_ports {DDR4B_DQ[40]}]
set_property PACKAGE_PIN K21 [get_ports {DDR4B_DQ[41]}]
set_property PACKAGE_PIN J19 [get_ports {DDR4B_DQ[42]}]
set_property PACKAGE_PIN K20 [get_ports {DDR4B_DQ[43]}]
set_property PACKAGE_PIN K18 [get_ports {DDR4B_DQ[44]}]
set_property PACKAGE_PIN H20 [get_ports {DDR4B_DQ[45]}]
set_property PACKAGE_PIN L18 [get_ports {DDR4B_DQ[46]}]
set_property PACKAGE_PIN J20 [get_ports {DDR4B_DQ[47]}]
set_property PACKAGE_PIN A23 [get_ports {DDR4B_DQ[48]}]
set_property PACKAGE_PIN C26 [get_ports {DDR4B_DQ[49]}]
set_property PACKAGE_PIN C24 [get_ports {DDR4B_DQ[50]}]
set_property PACKAGE_PIN A26 [get_ports {DDR4B_DQ[51]}]
set_property PACKAGE_PIN A24 [get_ports {DDR4B_DQ[52]}]
set_property PACKAGE_PIN B26 [get_ports {DDR4B_DQ[53]}]
set_property PACKAGE_PIN A25 [get_ports {DDR4B_DQ[54]}]
set_property PACKAGE_PIN C25 [get_ports {DDR4B_DQ[55]}]
set_property PACKAGE_PIN N19 [get_ports {DDR4B_DQ[56]}]
set_property PACKAGE_PIN N20 [get_ports {DDR4B_DQ[57]}]
set_property PACKAGE_PIN P22 [get_ports {DDR4B_DQ[58]}]
set_property PACKAGE_PIN N21 [get_ports {DDR4B_DQ[59]}]
set_property PACKAGE_PIN P19 [get_ports {DDR4B_DQ[60]}]
set_property PACKAGE_PIN N22 [get_ports {DDR4B_DQ[61]}]
set_property PACKAGE_PIN P18 [get_ports {DDR4B_DQ[62]}]
set_property PACKAGE_PIN P20 [get_ports {DDR4B_DQ[63]}]
set_property PACKAGE_PIN E21 [get_ports {DDR4B_DQ[64]}]
set_property PACKAGE_PIN G22 [get_ports {DDR4B_DQ[65]}]
set_property PACKAGE_PIN E22 [get_ports {DDR4B_DQ[66]}]
set_property PACKAGE_PIN G21 [get_ports {DDR4B_DQ[67]}]
set_property PACKAGE_PIN D22 [get_ports {DDR4B_DQ[68]}]
set_property PACKAGE_PIN H21 [get_ports {DDR4B_DQ[69]}]
set_property PACKAGE_PIN E20 [get_ports {DDR4B_DQ[70]}]
set_property PACKAGE_PIN H22 [get_ports {DDR4B_DQ[71]}]
set_property IOSTANDARD POD12_DCI [get_ports DDR4B_DQ[*]]

set_property PACKAGE_PIN N14 [get_ports {DDR4B_LDQS_N[0]}]
set_property PACKAGE_PIN L14 [get_ports {DDR4B_LDQS_N[1]}]
set_property PACKAGE_PIN C19 [get_ports {DDR4B_LDQS_N[2]}]
set_property PACKAGE_PIN B24 [get_ports {DDR4B_LDQS_N[3]}]
set_property PACKAGE_PIN G18 [get_ports {DDR4B_LDQS_N[4]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports DDR4B_LDQS_N[*]]

set_property PACKAGE_PIN P14 [get_ports {DDR4B_LDQS_P[0]}]
set_property PACKAGE_PIN L15 [get_ports {DDR4B_LDQS_P[1]}]
set_property PACKAGE_PIN C20 [get_ports {DDR4B_LDQS_P[2]}]
set_property PACKAGE_PIN B23 [get_ports {DDR4B_LDQS_P[3]}]
set_property PACKAGE_PIN G19 [get_ports {DDR4B_LDQS_P[4]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports DDR4B_LDQS_P[*]]

set_property PACKAGE_PIN F14 [get_ports {DDR4B_UDQS_N[0]}]
set_property PACKAGE_PIN B16 [get_ports {DDR4B_UDQS_N[1]}]
set_property PACKAGE_PIN J22 [get_ports {DDR4B_UDQS_N[2]}]
set_property PACKAGE_PIN L21 [get_ports {DDR4B_UDQS_N[3]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports DDR4B_UDQS_N[*]]

set_property PACKAGE_PIN G14 [get_ports {DDR4B_UDQS_P[0]}]
set_property PACKAGE_PIN C16 [get_ports {DDR4B_UDQS_P[1]}]
set_property PACKAGE_PIN K22 [get_ports {DDR4B_UDQS_P[2]}]
set_property PACKAGE_PIN M21 [get_ports {DDR4B_UDQS_P[3]}]
set_property IOSTANDARD DIFF_POD12_DCI [get_ports DDR4B_UDQS_P[*]]

set_property PACKAGE_PIN D24 [get_ports {DDR4B_ODT}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4B_ODT*]

set_property PACKAGE_PIN F24 [get_ports {DDR4B_BG[0]}]
set_property PACKAGE_PIN E26 [get_ports {DDR4B_BG[1]}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4B_BG[*]]
set_property IOSTANDARD LVCMOS12 [get_ports DDR4B_BG[1]]

set_property PACKAGE_PIN D14 [get_ports {DDR4B_RESET_N}]
set_property IOSTANDARD LVCMOS12 [get_ports DDR4B_RESET_N]
set_property DRIVE 8 [get_ports DDR4B_RESET_N]

set_property PACKAGE_PIN E23 [get_ports {DDR4B_ACT_N}]
set_property IOSTANDARD SSTL12_DCI [get_ports DDR4B_ACT_N]

set_property PACKAGE_PIN D27 [get_ports {DDR4B_CK_N}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports DDR4B_CK_N[*]]

set_property PACKAGE_PIN E27 [get_ports {DDR4B_CK_P}]
set_property IOSTANDARD DIFF_SSTL12_DCI [get_ports DDR4B_CK_P[*]]