class axi_vip_amaster_driver extends uvm_driver#(axi_vip_amaster_seq_item);

  `uvm_component_utils(axi_vip_amaster_driver)
  axi_vip_cfg               axi_cfg;
 
  virtual axi_vip_amaster_intf axi_amaster_intf;
   int drive_idx;
     
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual axi_vip_amaster_intf)::get(this,"","axi_master_if",axi_amaster_intf))
      `uvm_fatal(get_type_name(),"DRIVER FAILED TO GET AXI MASTER INTF")

	 axi_cfg           = axi_vip_cfg::type_id::create("axi_cfg",this);
  endfunction
      
      task reset_phase(uvm_phase phase);
    super.reset_phase(phase);
    //phase.raise_objection(phase);
    //`uvm_info(get_type_name(),"reset phase started",UVM_NONE)
    //wait(!axi_amaster_intf.rst_n);
    //`uvm_info(get_type_name(),$sformatf("reset applied"),UVM_NONE)
    //    axi_amaster_intf.AW_m2s.AWADDR  <= 'b0;
    //    //if(!axi_cfg.axi_lite_mode) axi_amaster_intf.AW_m2s.AWLEN   <= 'b0;
    //    axi_amaster_intf.AW_m2s.AWVALID <= 'b0;
    // wait(axi_amaster_intf.rst_n);
    //drive_idx = 0;
    //`uvm_info(get_type_name(),$sformatf("reset released"),UVM_NONE)
    //phase.drop_objection(phase);
    endtask
    
   
    task main_drive();
     
      axi_vip_amaster_seq_item axi_amaster_seq_item;

      forever @(axi_amaster_intf.amaster_cb or negedge axi_amaster_intf.rst_n ) begin
 
        if(!axi_amaster_intf.rst_n) begin
				`uvm_info(get_type_name(),$sformatf("##########################################################"),UVM_NONE)
				`uvm_info(get_type_name(),$sformatf("####################RESET APPLIED#########################"),UVM_NONE)
				`uvm_info(get_type_name(),$sformatf("##########################################################"),UVM_NONE)
						axi_amaster_intf.AW_m2s.AWVALID <= 0;
						axi_amaster_intf.AW_m2s.AWADDR <= 0;

				 while(1) begin
					seq_item_port.try_next_item(axi_amaster_seq_item);
					if(axi_amaster_seq_item != null)
				   	seq_item_port.item_done();
					else
						break;
				 end

			end
			else begin
		  //if(	axi_amaster_intf.amaster_cb.AW_s2m.AWREADY) begin
			axi_amaster_intf.amaster_cb.AW_m2s.AWVALID <= 'b0; 
			axi_amaster_intf.amaster_cb.W_m2s.WVALID <= 'b0;
    	seq_item_port.try_next_item(axi_amaster_seq_item);
			if(axi_amaster_seq_item) begin
          `uvm_info(get_type_name(),$sformatf("driver item got %0d",drive_idx),UVM_NONE)
      	drive_idx++;
         
            
      	axi_amaster_intf.amaster_cb.AW_m2s.AWADDR  <= axi_amaster_seq_item.axi_awaddr;
         //if(!axi_cfg.axi_lite_mode) axi_amaster_intf.amaster_cb.AW_m2s.AWLEN   <= axi_amaster_seq_item.axi_awlen;
        axi_amaster_intf.amaster_cb.AW_m2s.AWVALID <= 'b1;
			//fork
			// while(!axi_amaster_intf.amaster_cb.W_s2m.WREADY) begin
          	axi_amaster_intf.amaster_cb.W_m2s.WDATA  <= axi_amaster_seq_item.axi_wdata[0];
			 	axi_amaster_intf.amaster_cb.W_m2s.WVALID <= 1;
			 //end
			//join_none
			
        seq_item_port.item_done();
			end
		  end
        end
  //  end
    endtask
    
    task main();
     
      axi_vip_amaster_seq_item axi_amaster_seq_item;

      forever @(axi_amaster_intf.amaster_cb or negedge axi_amaster_intf.rst_n ) begin
			seq_item_port.try_next_item(axi_amaster_seq_item);
			//if(axi_amaster_seq_item) begin
        		if(!axi_amaster_intf.rst_n) begin
				`uvm_info(get_type_name(),$sformatf("##########################################################"),UVM_NONE)
				`uvm_info(get_type_name(),$sformatf("####################RESET APPLIED#########################"),UVM_NONE)
				`uvm_info(get_type_name(),$sformatf("##########################################################"),UVM_NONE)
						axi_amaster_intf.AW_m2s.AWVALID <= 0;
						axi_amaster_intf.AW_m2s.AWADDR <= 0;
				 if(axi_amaster_seq_item != null) begin
					seq_item_port.item_done();
				 end
				 //else begin
				 //	break;
				 //end
				 while(1) begin
					seq_item_port.try_next_item(axi_amaster_seq_item);
					if(axi_amaster_seq_item != null)
				   	seq_item_port.item_done();
					else
						break;
				 end

			end

			else begin
				if(axi_amaster_seq_item) begin
         		`uvm_info(get_type_name(),$sformatf("driver item got %0d",drive_idx),UVM_NONE)
      			drive_idx++;
               axi_amaster_intf.amaster_cb.AW_m2s.AWADDR  <= axi_amaster_seq_item.axi_awaddr;
        			axi_amaster_intf.amaster_cb.AW_m2s.AWVALID <= 'b1;
          		axi_amaster_intf.amaster_cb.W_m2s.WDATA  <= axi_amaster_seq_item.axi_wdata[0];
			 		axi_amaster_intf.amaster_cb.W_m2s.WVALID <= 1;
					seq_item_port.item_done();
				end
			end
		 end
    endtask
 
    
  task main_phase(uvm_phase phase);
    
    
    super.main_phase(phase);
   
    main();
   
       
  endtask
  
endclass 
