`include "uvm_macros.svh"
import uvm_pkg::*;
import axi_vip_pkg::*;
`include "tests/axi_vip_test_lib.sv"

module axi_vip_top;
  
  bit clk,rst_n;
  //`include "testbench.sv"
  always#5 clk = ~clk;
  
  axi_vip_amaster_intf axi_amaster_intf(.clk(clk),.rst_n(rst_n));
  
  initial begin
    uvm_config_db#(virtual axi_vip_amaster_intf) :: set(uvm_root::get(),"*","axi_master_if",axi_amaster_intf);
  end
  //axi_vip_slave_intf
  initial begin
    $dumpfile("axi_vip.vcd");
    $dumpvars;
    //#1000 
    //$finish;
  end
  
  initial begin
    reset_sequence();
   //rst_n = 0;
    //#2 rst_n = 1;
  end
  
  initial begin
    //$dumpfile("axi_vip.vcd");
    //$dumpvars;
    run_test();
  end
  
 task reset_sequence();
    int repeat_num,on_delay,off_delay;
   repeat_num = $urandom_range(0,4);
   on_delay   = $urandom_range(10,20);
   off_delay  = $urandom_range(100,200);
    repeat(repeat_num) begin
     rst_n = 1;
      #(off_delay) rst_n = 0;
      #(on_delay) rst_n = 1;
    end
    
  endtask
  
endmodule
