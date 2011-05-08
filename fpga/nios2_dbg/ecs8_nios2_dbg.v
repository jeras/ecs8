module ecs8_nios2_dbg (
  // system clock (32.768MHz)
  input wire         clk,
  // EPCS SPI Flash interface
//  output wire        epcs_asd,
//  output wire        epcs_cs_n,
  // PIO
  input  wire  [1:0] button,
  input  wire  [1:0] switch,
  output wire  [1:0] led_n,
  input  wire        rtc_irq_n,
  // 1-wire
  inout  wire        onewire,
  // I2C
  inout  wire        i2c_scl,
  inout  wire        i2c_sda,
  // UART user
  input  wire        uart_user_rxd,
  output wire        uart_user_txd,
  // UART host (can be used as a GPIO)
  inout  wire        uart_host_rxd,
  inout  wire        uart_host_rts,
  inout  wire        uart_host_txd,
  inout  wire        uart_host_cts,
  // Flash and Ethernet shared IO
  output wire [26:1] ef_a,
  output wire [31:0] ef_d,
  // Flash
  output wire        flash_ce_n,
  output wire        flash_we_n,
  output wire        flash_oe_n,
  output wire        flash_reset_n,
//  output wire        flash_wp_n,
  input  wire        flash_wp_n,
  input  wire        flash_ry_by_n,
  // Ethernet
  output wire        enet_wr_n,
  output wire        enet_rd_n,
  output wire  [3:0] enet_be_n,
  input  wire        enet_intr,
  output wire        enet_res,
  // DDR SDRAM
  output wire  [0:0] ddr_ck_p,
  output wire  [0:0] ddr_ck_n,
  output wire  [0:0] ddr_cke,
  output wire  [0:0] ddr_cs_n,
  output wire        ddr_we_n,
  output wire        ddr_ras_n,
  output wire        ddr_cas_n,
  output wire  [1:0] ddr_ba,
  output wire [12:0] ddr_a,
  output wire  [1:0] ddr_dm,
  inout  wire  [1:0] ddr_dqs,
  inout  wire [15:0] ddr_dq
);

// system signals
wire        rst_n;
wire        clk_int;
wire        pll_locked;

// extra ddr clocks
wire        clk_ddr_write;
wire        clk_ddr_resynch;

// LED signals
wire  [1:0] led;

// 1-wire signals
wire        onewire_e;
wire        onewire_i;
wire        onewire_p;

// PLL
pll_soc pll (
  .inclk0  (clk),              //       32.768MHz
  .c0      (clk_int),          // 13/5  85.1968MHz    0deg
  .c1      (clk_ddr_write),    // 13/5  85.1968MHz  270deg
  .c2      (clk_ddr_resynch),  // 13/5  85.1968MHz  270deg
  .locked  (pll_locked)
);

// reset source (10ms debounce)
reset #(500) reset (
  .clk      (clk_int),
  .rst_n_i  (~button[1] & pll_locked),
  .rst_n_o  (rst_n)
);

// LED outputs
assign led_n[0] = ~led[0];
assign led_n[1] = ~led[1] & rst_n;

// SOC instance
soc_dbg soc (
  // system signals (clock, reset)
  .clk                                (clk_int),
  .reset_n                            (rst_n),
  // DDR SDRAM
  .clk_to_sdram_from_the_ddr_sdram    (ddr_ck_p),
  .clk_to_sdram_n_from_the_ddr_sdram  (ddr_ck_n),
  .ddr_cke_from_the_ddr_sdram         (ddr_cke),
  .ddr_cs_n_from_the_ddr_sdram        (ddr_cs_n),
  .ddr_we_n_from_the_ddr_sdram        (ddr_we_n),
  .ddr_ras_n_from_the_ddr_sdram       (ddr_ras_n),
  .ddr_cas_n_from_the_ddr_sdram       (ddr_cas_n),
  .ddr_ba_from_the_ddr_sdram          (ddr_ba),
  .ddr_a_from_the_ddr_sdram           (ddr_a),
  .ddr_dm_from_the_ddr_sdram          (ddr_dm),
  .ddr_dqs_to_and_from_the_ddr_sdram  (ddr_dqs),
  .ddr_dq_to_and_from_the_ddr_sdram   (ddr_dq),
  // UART
  .rxd_to_the_uart                    (uart_user_rxd),
  .txd_from_the_uart                  (uart_user_txd),
  // 1-wire
  .owr_e_from_the_onewire             (onewire_e),
  .owr_i_to_the_onewire               (onewire_i),
  .owr_p_from_the_onewire             (onewire_p),
  // PIO
  .out_port_from_the_pio_o            (led),
  .in_port_to_the_pio_i               ({switch, button}),
  // Ethernet
  .iow_n_to_the_lan91c111             (enet_wr_n),
  .ior_n_to_the_lan91c111             (enet_rd_n),
  .byteenablen_to_the_lan91c111       (enet_be_n),
  .irq_from_the_lan91c111             (enet_intr),
  .reset_to_the_lan91c111             (enet_res),
  // Flash
  .select_n_to_the_cfi_flash          (flash_ce_n),
  .read_n_to_the_cfi_flash            (flash_oe_n),
  .write_n_to_the_cfi_flash           (flash_we_n),
  // Flash and Ethernet shared IO
  .tri_state_address                  (ef_a[23:1]),
  .tri_state_data                     (ef_d)
);

// 1-wire IO
assign onewire   = (onewire_p | onewire_e) ? onewire_p : 1'bz;
assign onewire_i =  onewire;

// Flash IO
// unused flash signals
//assign flash_wp_n    = 1'b0;
assign flash_reset_n = 1'b1;
assign ef_a[26:24] = 3'bzzz;

endmodule
