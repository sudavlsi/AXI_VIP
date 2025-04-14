// Code your testbench here
// or browse Examples
`include "uvm_macros.svh"
import uvm_pkg::*;
import axi_vip_pkg::*; 
class axi_vip_base_test extends uvm_test;
  `uvm_component_utils(axi_vip_base_test)
  
  axi_vip_env  axi_env;
  axi_vip_vseq axi_vseq;
  virtual axi_vip_amaster_intf axi_amaster_intf;
  
  function new(string name ,uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    axi_env = axi_vip_env::type_id::create("axi_env",this);
    axi_vseq = axi_vip_vseq::type_id::create("axi_vseq",this);
    
    if(!uvm_config_db#(virtual axi_vip_amaster_intf)::get(this,"","axi_master_if",axi_amaster_intf))
      `uvm_fatal(get_type_name(),"DRIVER FAILED TO GET AXI MASTER INTF")
      
  endfunction
      
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    //uvm_top.print_topology();
  endfunction
  
  
  
  task main_phase(uvm_phase phase);
    super.main_phase(phase);
    phase.raise_objection(phase);
    `uvm_info(get_type_name(),"#######################",UVM_NONE)
    `uvm_info(get_type_name(),"main phase started",UVM_NONE)
    `uvm_info(get_type_name(),"#######################",UVM_NONE)
    uvm_top.print_topology();
    
    axi_vseq.start(axi_env.axi_vseqr);   
    
 
    #100ns;
    phase.drop_objection(phase);
  endtask
endclass
