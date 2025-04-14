class axi_vip_vseq extends uvm_sequence;
  
   `uvm_object_utils(axi_vip_vseq)
  `uvm_declare_p_sequencer(axi_vip_vseqr)
  
  virtual axi_vip_amaster_intf axi_amaster_intf;
  axi_vip_amaster_write_req_seq axi_amaster_write_req_seq;
     
  function new (string name = "");
    super.new(name);
  endfunction : new
  
  task body();
    super.body();
    
    if(!uvm_config_db#(virtual axi_vip_amaster_intf)::get(null,"","axi_master_if",axi_amaster_intf))
      `uvm_fatal(get_type_name(),"DRIVER FAILED TO GET AXI MASTER INTF")
      
     axi_amaster_write_req_seq = axi_vip_amaster_write_req_seq::type_id::create("axi_amaster_seq");
    
    axi_amaster_write_req_seq.start(p_sequencer.axi_amaster_seqr);
    
    /* begin
      fork
        begin
          axi_amaster_write_req_seq.start(p_sequencer.axi_amaster_seqr);
        end
        begin
          wait(!axi_amaster_intf.rst_n);
        end
      join_any
      disable fork;
        if(!axi_amaster_intf.rst_n) begin 
          `uvm_info(get_type_name(),$sformatf("reset applied"),UVM_NONE)
          p_sequencer.axi_amaster_seqr.stop_sequences();
          //p_sequencer.stop_sequences();
          //phase.jump(uvm_pre_reset_phase::get());
        end
     end*/
    
  endtask
endclass