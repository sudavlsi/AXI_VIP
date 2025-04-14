class axi_vip_amaster_seq_item extends uvm_sequence_item;
  `uvm_object_utils(axi_vip_amaster_seq_item)
  
  rand bit [`AXI_ADDR_WIDTH - 1 :0]          axi_awaddr;
  rand bit [$clog2(`AXI_MAX_BURST_LEN)-1 :0] axi_awlen;
  rand bit [31 :0] axi_wdata[$clog2(`AXI_MAX_BURST_LEN)-1 :0];
  
  
  function new(string name ="");
    super.new(name);
  endfunction
  
  function void sprint();
    string TRANS_PRINT="";
    $sformat(TRANS_PRINT,"\n######TRANSACTION ACTIVE MASTER#############\nAWADDR %0h\nAWLEN  %0h \nWDATA: ",axi_awaddr,axi_awlen);
    foreach(axi_wdata[idx]) begin
      if(idx == $clog2(`AXI_MAX_BURST_LEN) - 1) TRANS_PRINT = {TRANS_PRINT,$sformatf("%h  ",axi_wdata[idx])};
      else                                      TRANS_PRINT = {TRANS_PRINT,$sformatf("%h ,",axi_wdata[idx])};
    end
    `uvm_info(get_type_name(),$sformatf("%s",TRANS_PRINT),UVM_NONE)  
    //foreach(axi_wdata[idx])`uvm_info("",$sformatf("idx=%0d axi_wdata %h",idx,axi_wdata[idx]),UVM_NONE)
  endfunction
  
endclass