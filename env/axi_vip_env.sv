class axi_vip_env extends uvm_env;
  `uvm_component_utils(axi_vip_env)
  
  axi_vip_amaster_agent axi_amaster_agent;
  axi_vip_vseqr         axi_vseqr;
  virtual axi_vip_amaster_intf axi_amaster_intf;
  
  function new(string name ,uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    axi_amaster_agent = axi_vip_amaster_agent::type_id::create("axi_amaster_agent",this);
    axi_vseqr         = axi_vip_vseqr::type_id::create("axi_vseqr",this);
    
     if(!uvm_config_db#(virtual axi_vip_amaster_intf)::get(this,"","axi_master_if",axi_amaster_intf))
      `uvm_fatal(get_type_name(),"DRIVER FAILED TO GET AXI MASTER INTF")
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    axi_vseqr.axi_amaster_seqr = axi_amaster_agent.axi_amaster_sequencer;
  endfunction
  
  task main_phase(uvm_phase phase);
    super.main_phase(phase);
   // forever begin
//      wait(!axi_amaster_intf.rst_n);
  //  `uvm_info(get_type_name(),"stop sequences found",UVM_NONE)
  // if(!axi_amaster_intf.rst_n) phase.jump(uvm_pre_reset_phase::get());
      //break;
   // end
    
  endtask
 
endclass
