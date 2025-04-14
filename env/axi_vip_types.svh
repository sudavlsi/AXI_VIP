`include "axi_vip_defines.svh"
`define AXI_VIP_ADDR_WIDTH 32
`define AXI_VIP_DATA_WIDTH 32
localparam AXI_VIP_ADDR_WIDTH = `AXI_VIP_ADDR_WIDTH;
localparam AXI_VIP_DATA_WIDTH = `AXI_VIP_DATA_WIDTH;
typedef  struct  {
  logic [`AXI_VIP_ADDR_WIDTH - 1 :0] AWADDR;
  logic 						 AWVALID;
  logic [`AXI_MAX_BURST_LEN-1 :0]AWLEN;
}axi_amaster_aw_t;

typedef  struct  {
  logic [`AXI_VIP_ADDR_WIDTH - 1 :0] WDATA;
  logic 						 WVALID;
  //logic [`AXI_MAX_BURST_LEN-1 :0]AWLEN;
}axi_amaster_w_t;

// Structure to hold Write Address Channel signals
typedef struct packed {
    logic [AXI_VIP_ADDR_WIDTH-1:0] AWADDR;   // Write address
    logic        AWVALID;  // Write address valid
	 //logic [`AXI_MAX_BURST_LEN-1 :0]AWLEN;
} AW_m2s_t;

// Structure to hold Write Address Channel signals
typedef struct packed {
    logic        AWREADY;  // Write address ready
} AW_s2m_t;

// Structure to hold Write Data Channel signals
typedef struct packed {
    logic [AXI_VIP_DATA_WIDTH-1:0] WDATA;    // Write data
    //logic [AXI_VIP_DATA_WIDTH/8-1:0]  WSTRB;    // Write strobes (byte enables)
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
    logic [AXI_VIP_ADDR_WIDTH-1:0] ARADDR;   // Read address
    logic        ARVALID;  // Read address valid
} AR_m2s_t;

// Structure to hold Read Address Channel signals
typedef struct packed {
    logic        ARREADY;  // Read address ready
} AR_s2m_t;

// Structure to hold Read Data Channel signals
typedef struct packed {
    logic [AXI_VIP_DATA_WIDTH-1:0] RDATA;    // Read data
    logic [1:0]  RRESP;    // Read response (OKAY, ERROR, etc.)
    logic        RVALID;   // Read data valid
} R_s2m_t;

// Structure to hold Read Data Channel signals
typedef struct packed {
    logic        RREADY;   // Read data ready
} R_m2s_t;

