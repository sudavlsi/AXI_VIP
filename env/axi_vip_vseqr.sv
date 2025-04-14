class axi_vip_vseqr extends uvm_sequencer;

   `uvm_component_utils(axi_vip_vseqr)
  
  axi_vip_amaster_sequencer axi_amaster_seqr;
  virtual axi_vip_amaster_intf axi_amaster_intf;
     
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual axi_vip_amaster_intf)::get(this,"","axi_master_if",axi_amaster_intf))
      `uvm_fatal(get_type_name(),"DRIVER FAILED TO GET AXI MASTER INTF")
      
  endfunction
      
  task main_phase(uvm_phase phase);
    super.main_phase(phase);
   // forever begin
    //  wait(!axi_amaster_intf.rst_n);
    //`uvm_info(get_type_name(),"stop sequences found",UVM_NONE)
   //if(!axi_amaster_intf.rst_n) stop_sequences();
      //break;
   // end
    
  endtask
endclass 
