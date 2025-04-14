class axi_vip_amaster_write_req_seq_item extends axi_vip_amaster_seq_item;
  `uvm_object_utils(axi_vip_amaster_write_req_seq_item)
  
 // rand bit [`AXI_ADDR_WIDTH - 1 :0]          axi_awaddr;
 // rand bit [$clog2(`AXI_MAX_BURST_LEN)-1 :0] axi_awlen;
  
  function new(string name ="");
    super.new(name);
  endfunction
  
  //function void sprint();
  //  `uvm_info(get_type_name(),$sformatf("\n######TRANSACTION ACTIVE MASTER#############\nAWADDR %0h\nAWLEN  %0h",axi_awaddr,axi_awlen),UVM_NONE)  
  //endfunction
  
endclass