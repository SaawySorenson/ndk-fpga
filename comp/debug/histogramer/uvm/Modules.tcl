# Modules.tcl: Components include script
# Copyright (C) 2022 CESNET z. s. p. o.
# Author: Lukas Nevrkla <xnevrk03@stud.fit.vutbr.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

# Set paths

lappend COMPONENTS [ list "SV_MVB_UVM_BASE"     "$OFM_PATH/comp/uvm/mvb"                "FULL"]
lappend COMPONENTS [ list "SV_LOGIC_VECTOR"     "$OFM_PATH/comp/uvm/logic_vector"       "FULL"]
lappend COMPONENTS [ list "SV_LOGIC_VECTOR_MVB" "$OFM_PATH/comp/uvm/logic_vector_mvb"   "FULL"]

lappend MOD "$ENTITY_BASE/tbench/env/pkg.sv"
lappend MOD "$ENTITY_BASE/tbench/tests/pkg.sv"

lappend MOD "$ENTITY_BASE/tbench/dut.sv"
lappend MOD "$ENTITY_BASE/tbench/testbench.sv"
