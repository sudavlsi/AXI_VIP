 class axi_vip_amaster_seq extends uvm_sequence;
  `uvm_object_utils(axi_vip_amaster_seq)
  `uvm_declare_p_sequencer(axi_vip_amaster_sequencer)
  
  function new(string name ="");
    super.new(name);
  endfunction
  
  virtual task body();
    axi_vip_amaster_seq_item axi_amaster_seq_item;
    super.body();
    
    `uvm_info(get_type_name(),$sformatf("sequence started"),UVM_NONE)
    
    axi_amaster_seq_item = axi_vip_amaster_seq_item::type_id::create("axi_amaster_seq_item");
    
    repeat(20) begin
    wait_for_grant();//WAIT FOR GRANT FROM SEQUENCER TRIGGERS AFTER DRIVER GIVES GET_NEXT_ITEM
    if(!axi_amaster_seq_item.randomize())
      `uvm_fatal(get_type_name(),"RANDOMIZATION FAILURE")
     // #10ns;
    axi_amaster_seq_item.sprint();
    //#10ns;
    //`uvm_info(get_type_name(),$sformatf("Transaction is %p",axi_amaster_seq_item.print()),UVM_NONE)
    send_request(axi_amaster_seq_item);
    wait_for_item_done();
    end
  endtask
endclass

class axi_vip_amaster_write_req_seq extends uvm_sequence;
  `uvm_object_utils(axi_vip_amaster_write_req_seq)
  `uvm_declare_p_sequencer(axi_vip_amaster_sequencer)
  
  function new(string name ="");
    super.new(name);
  endfunction
  
  virtual task body();
    axi_vip_amaster_write_req_seq_item axi_amaster_write_req_seq_item;
    axi_vip_amaster_seq_item       axi_amaster_seq_item;
	//axi_vip_amaster_write_req_seq_item axi_amaster_write_req_seq_item;
    super.body();
    
    `uvm_info(get_type_name(),$sformatf("sequence started"),UVM_NONE)
    
    axi_amaster_write_req_seq_item = axi_vip_amaster_write_req_seq_item::type_id::create("axi_amaster_write_req_seq_item");
    axi_amaster_seq_item = axi_vip_amaster_seq_item::type_id::create("axi_amaster_seq_item");
     //phase.raise_objection(phase);
    //wait_for_grant();//WAIT FOR GRANT FROM SEQUENCER TRIGGERS AFTER DRIVER GIVES GET_NEXT_ITEM
    repeat(20) begin
    start_item(axi_amaster_write_req_seq_item);
    if(!axi_amaster_write_req_seq_item.randomize())
      `uvm_fatal(get_type_name(),"RANDOMIZATION FAILURE")
     // #10ns;
    axi_amaster_write_req_seq_item.sprint();
    //#10ns;
    
    //send_request(axi_amaster_write_req_seq_item);
    //wait_for_item_done();
    finish_item(axi_amaster_write_req_seq_item);
    end
    // phase.drop_objection(phase);
  endtask
endclass
