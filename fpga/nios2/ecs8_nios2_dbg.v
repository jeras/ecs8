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
  input  wire        uart_user_rx,
  output wire        uart_user_tx,
  // UART host (can be used as a GPIO)
  inout  wire        uart_host_rx,
  inout  wire        uart_host_rts,
  inout  wire        uart_host_tx,
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

// reset signal
wire rst_n;

// extra ddr clocks
wire clk_ddr_write;
wire clk_ddr_resynch;

// 1-wire signals
wire onewire_e;
wire onewire_i;
wire onewire_p;

// reset source
assign rst_n = button [1];

// SOC instance
soc_dbg soc (
  // system signals (clock, reset)
  .clk_pin                            (clk),
  .clk_int                            (),
  .clk_ddr_write                      (clk_ddr_write),
  .clk_ddr_resynch                    (clk_ddr_resynch),
  .reset_n                            (rst_n),
  // PLL outputs
  .locked_from_the_altpll_soc         (),
  .phasedone_from_the_altpll_soc      (),
  // extra DDR clocks
  .write_clk_to_the_ddr_sdram         (clk_ddr_write),
  .resynch_clk_to_the_ddr_sdram       (clk_ddr_resynch),
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
  .rxd_to_the_uart                    (uart_user_rx),
  .txd_from_the_uart                  (uart_user_tx),
  // 1-wire
  .owr_e_from_the_onewire             (onewire_e),
  .owr_i_to_the_onewire               (onewire_i),
  .owr_p_from_the_onewire             (onewire_p),
  // PIO
  .out_port_from_the_pio_o            (led_n),
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

// unused flash signals
//assign flash_wp_n    = 1'b0;
assign flash_reset_n = 1'b1;

endmodule
