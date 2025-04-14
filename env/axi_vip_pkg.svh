`ifndef AXI_VIP_PKG
	`define AXI_VIP_PKG
package axi_vip_pkg;
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "axi_vip_defines.svh"
`include "axi_vip_types.svh"
`include "axi_vip_cfg.sv"
`include "sequences/seq_item/axi_vip_amaster_seq_item.sv"
`include "sequences/seq_item/axi_vip_amaster_write_req_seq_item.sv"
`include "axi_vip_amaster_sequencer.sv"
`include "sequences/axi_vip_seq_lib.sv"
`include "axi_vip_vseqr.sv"
`include "sequences/axi_vip_vseq.sv"
`include "axi_vip_amaster_driver.sv"
`include "axi_vip_amaster_agent.sv"
`include "axi_vip_env.sv"
endpackage
`endif
