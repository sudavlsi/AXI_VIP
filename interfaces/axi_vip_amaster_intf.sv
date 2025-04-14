//`include "axi_vip_types.svh"
// Structure to hold Write Address Channel signals

interface axi_vip_amaster_intf#(parameter AXI_ADDR_WIDTH = 32,AXI_DATA_WIDTH = 32)(input wire logic clk,rst_n);

typedef struct packed {
    logic [AXI_ADDR_WIDTH-1:0] AWADDR;   // Write address
    logic        AWVALID;  // Write address valid
} AW_m2s_t;

// Structure to hold Write Address Channel signals
typedef struct packed {
    logic        AWREADY;  // Write address ready
} AW_s2m_t;

// Structure to hold Write Data Channel signals
typedef struct packed {
    logic [AXI_DATA_WIDTH-1:0] WDATA;    // Write data
    logic [AXI_DATA_WIDTH/8-1:0]  WSTRB;    // Write strobes (byte enables)
    logic        WVALID;   // Write data valid
} W_m2s_t;

// Structure to hold Write Data Channel signals
typedef struct packed {
    logic        WREADY;   // Write data ready
} W_s2m_t;

// Structure to hold Write Response Channel signals
typedef struct packed {
    logic [1:0] BRESP;     // Write response (OKAY, ERROR, etc.)
    logic        BVALID;   // Write response valid
} B_s2m_t;

// Structure to hold Write Response Channel signals
typedef struct packed {
    logic        BREADY;   // Write response ready
} B_m2s_t;

// Structure to hold Read Address Channel signals
typedef struct packed {
    logic [AXI_ADDR_WIDTH-1:0] ARADDR;   // Read address
    logic        ARVALID;  // Read address valid
} AR_m2s_t;

// Structure to hold Read Address Channel signals
typedef struct packed {
    logic        ARREADY;  // Read address ready
} AR_s2m_t;

// Structure to hold Read Data Channel signals
typedef struct packed {
    logic [AXI_DATA_WIDTH-1:0] RDATA;    // Read data
    logic [1:0]  RRESP;    // Read response (OKAY, ERROR, etc.)
    logic        RVALID;   // Read data valid
} R_s2m_t;

// Structure to hold Read Data Channel signals
typedef struct packed {
    logic        RREADY;   // Read data ready
} R_m2s_t;

  AW_m2s_t   AW_m2s;
  W_m2s_t    W_m2s;
  W_s2m_t    W_s2m;
  AW_s2m_t   AW_s2m;
  
  //assign AW_p = rst_n? AW : '{default:'b0};
    
  clocking amaster_cb@(posedge clk );
    output AW_m2s,W_m2s;
    input  AW_s2m,W_s2m; 
  endclocking
  
  //always@(negedge rst_n) begin
   // if(!rst_n) AW <= '{default:'b0};
    //else       AW_o <= AW;
  //end
  
endinterface
