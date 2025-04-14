class axi_vip_amaster_agent extends uvm_agent;

  `uvm_component_utils(axi_vip_amaster_agent)
     
  axi_vip_amaster_sequencer axi_amaster_sequencer;
  axi_vip_amaster_driver    axi_amaster_driver;
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    axi_amaster_sequencer = axi_vip_amaster_sequencer::type_id::create("axi_amaster_sequencer",this);
    axi_amaster_driver    = axi_vip_amaster_driver   ::type_id::create("axi_amaster_driver",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    axi_amaster_driver.seq_item_port.connect(axi_amaster_sequencer.seq_item_export); 
  endfunction
endclass 