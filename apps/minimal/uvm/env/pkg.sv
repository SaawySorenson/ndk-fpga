/*
 * file       : pkg.sv
 * Copyright (C) 2021 CESNET z. s. p. o.
 * description: verification eviroment for application core
 * date       : 2021
 * author     : Radek Iša <isa@cesnet.ch>
 *
 * SPDX-License-Identifier: BSD-3-Clause
*/

`ifndef APPLICATTION_CORE_PKG
`define APPLICATTION_CORE_PKG

package uvm_app_core_minimal;

    `include "uvm_macros.svh"
    import uvm_pkg::*;

    `uvm_analysis_imp_decl(_reset)
    //`uvm_analysis_imp_decl(_model)
    //`uvm_analysis_imp_decl(_dut)

    `include "regmodel.sv"
    `include "reg_sequnece.sv"

    `include "model.sv"
    `include "env.sv"

endpackage

`endif
