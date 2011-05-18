#ifndef _ALTERA_ECS8_NIOS2_MMU_H_
#define _ALTERA_ECS8_NIOS2_MMU_H_

/*
 * This file was automatically generated by the swinfo2header utility.
 * 
 * Created from SOPC Builder system 'soc_mmu' in
 * file './soc_mmu.sopcinfo'.
 */

/*
 * This file contains macros for module 'cpu' and devices
 * connected to the following masters:
 *   instruction_master
 *   tightly_coupled_instruction_master_0
 *   data_master
 *   tightly_coupled_data_master_0
 * 
 * Do not include this header file and another header file created for a
 * different module or master group at the same time.
 * Doing so may result in duplicate macro names.
 * Instead, use the system header file which has macros with unique names.
 */

/*
 * Macros for module 'cpu', class 'altera_nios2'.
 * The macros have no prefix.
 */
#define CPU_IMPLEMENTATION "fast"
#define BIG_ENDIAN 0
#define CPU_FREQ 65536000
#define ICACHE_LINE_SIZE 32
#define ICACHE_LINE_SIZE_LOG2 5
#define ICACHE_SIZE 4096
#define DCACHE_LINE_SIZE 32
#define DCACHE_LINE_SIZE_LOG2 5
#define DCACHE_SIZE 4096
#define INITDA_SUPPORTED 
#define FLUSHDA_SUPPORTED 
#define HAS_JMPI_INSTRUCTION 
#define MMU_PRESENT 
#define KERNEL_REGION_BASE 0xc0000000
#define IO_REGION_BASE 0xe0000000
#define KERNEL_MMU_REGION_BASE 0x80000000
#define USER_REGION_BASE 0x0
#define PROCESS_ID_NUM_BITS 8
#define TLB_NUM_WAYS 8
#define TLB_NUM_WAYS_LOG2 3
#define TLB_PTR_SZ 7
#define TLB_NUM_ENTRIES 128
#define FAST_TLB_MISS_EXCEPTION_ADDR 0x0
#define EXCEPTION_ADDR 0x0
#define RESET_ADDR 0x0
#define BREAK_ADDR 0x0
#define HAS_DEBUG_STUB 
#define HAS_DEBUG_CORE 0
#define HAS_ILLEGAL_INSTRUCTION_EXCEPTION 
#define HAS_ILLEGAL_MEMORY_ACCESS_EXCEPTION 
#define HAS_EXTRA_EXCEPTION_INFO 
#define CPU_ID_SIZE 1
#define CPU_ID_VALUE 0x0
#define HARDWARE_DIVIDE_PRESENT 0
#define HARDWARE_MULTIPLY_PRESENT 1
#define HARDWARE_MULX_PRESENT 0
#define INST_ADDR_WIDTH 29
#define DATA_ADDR_WIDTH 29
#define NUM_OF_SHADOW_REG_SETS 0

/*
 * Macros for device 'epcs', class 'altera_avalon_epcs_flash_controller'
 * The macros are prefixed with 'EPCS_'.
 * The prefix is the slave descriptor.
 */
#define EPCS_COMPONENT_TYPE altera_avalon_epcs_flash_controller
#define EPCS_COMPONENT_NAME epcs
#define EPCS_BASE 0x0
#define EPCS_SPAN 2048
#define EPCS_END 0x7ff
#define EPCS_IRQ 0
#define EPCS_REGISTER_OFFSET 512
#define EPCS_MEMORY_INFO_MEM_INIT_DATA_WIDTH 32
#define EPCS_MEMORY_INFO_MEM_INIT_FILENAME epcs_boot_rom
#define EPCS_MEMORY_INFO_IS_EPCS 1
#define EPCS_MEMORY_INFO_IS_FLASH 1
#define EPCS_MEMORY_INFO_GENERATE_HEX 1
#define EPCS_MEMORY_INFO_GENERATE_DAT_SYM 1
#define EPCS_MEMORY_INFO_GENERATE_FLASH 1
#define EPCS_MEMORY_INFO_HEX_INSTALL_DIR SIM_DIR
#define EPCS_MEMORY_INFO_DAT_SYM_INSTALL_DIR SIM_DIR
#define EPCS_MEMORY_INFO_FLASH_INSTALL_DIR APP_DIR

/*
 * Macros for device 'onchip_memory2', class 'altera_avalon_onchip_memory2'
 * The macros are prefixed with 'ONCHIP_MEMORY2_'.
 * The prefix is the slave descriptor.
 */
#define ONCHIP_MEMORY2_COMPONENT_TYPE altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_COMPONENT_NAME onchip_memory2
#define ONCHIP_MEMORY2_BASE 0x800000
#define ONCHIP_MEMORY2_SPAN 1024
#define ONCHIP_MEMORY2_END 0x8003ff
#define ONCHIP_MEMORY2_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_INIT_CONTENTS_FILE "onchip_memory2"
#define ONCHIP_MEMORY2_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_GUI_RAM_BLOCK_TYPE "M4K"
#define ONCHIP_MEMORY2_WRITABLE 1
#define ONCHIP_MEMORY2_DUAL_PORT 1
#define ONCHIP_MEMORY2_SINGLE_CLOCK_OP 1
#define ONCHIP_MEMORY2_SIZE_VALUE 1024
#define ONCHIP_MEMORY2_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_RAM_BLOCK_TYPE "M4K"
#define ONCHIP_MEMORY2_INIT_MEM_CONTENT 0
#define ONCHIP_MEMORY2_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_MEMORY_INFO_MEM_INIT_DATA_WIDTH 32
#define ONCHIP_MEMORY2_MEMORY_INFO_HAS_BYTE_LANE 0
#define ONCHIP_MEMORY2_MEMORY_INFO_GENERATE_HEX 1
#define ONCHIP_MEMORY2_MEMORY_INFO_HEX_INSTALL_DIR QPF_DIR
#define ONCHIP_MEMORY2_MEMORY_INFO_GENERATE_DAT_SYM 1
#define ONCHIP_MEMORY2_MEMORY_INFO_DAT_SYM_INSTALL_DIR SIM_DIR
#define ONCHIP_MEMORY2_MEMORY_INFO_MEM_INIT_FILENAME onchip_memory2

/*
 * Macros for device 'cfi_flash', class 'altera_avalon_cfi_flash'
 * The macros are prefixed with 'CFI_FLASH_'.
 * The prefix is the slave descriptor.
 */
#define CFI_FLASH_COMPONENT_TYPE altera_avalon_cfi_flash
#define CFI_FLASH_COMPONENT_NAME cfi_flash
#define CFI_FLASH_BASE 0x1000000
#define CFI_FLASH_SPAN 8388608
#define CFI_FLASH_END 0x17fffff
#define CFI_FLASH_SETUP_VALUE 0
#define CFI_FLASH_WAIT_VALUE 90
#define CFI_FLASH_HOLD_VALUE 0
#define CFI_FLASH_TIMING_UNITS "ns"
#define CFI_FLASH_SIZE 8388608
#define CFI_FLASH_MEMORY_INFO_MEM_INIT_DATA_WIDTH 16
#define CFI_FLASH_MEMORY_INFO_HAS_BYTE_LANE 1
#define CFI_FLASH_MEMORY_INFO_IS_FLASH 1
#define CFI_FLASH_MEMORY_INFO_GENERATE_DAT_SYM 1
#define CFI_FLASH_MEMORY_INFO_GENERATE_FLASH 1
#define CFI_FLASH_MEMORY_INFO_DAT_SYM_INSTALL_DIR SIM_DIR
#define CFI_FLASH_MEMORY_INFO_FLASH_INSTALL_DIR APP_DIR

/*
 * Macros for device 'lan91c111', class 'altera_avalon_lan91c111'
 * The macros are prefixed with 'LAN91C111_'.
 * The prefix is the slave descriptor.
 */
#define LAN91C111_COMPONENT_TYPE altera_avalon_lan91c111
#define LAN91C111_COMPONENT_NAME lan91c111
#define LAN91C111_BASE 0x1800000
#define LAN91C111_SPAN 65536
#define LAN91C111_END 0x180ffff
#define LAN91C111_IRQ 1
#define LAN91C111_IS_ETHERNET_MAC 1
#define LAN91C111_LAN91C111_REGISTERS_OFFSET 768
#define LAN91C111_LAN91C111_DATA_BUS_WIDTH 32

/*
 * Macros for device 'timer', class 'altera_avalon_timer'
 * The macros are prefixed with 'TIMER_'.
 * The prefix is the slave descriptor.
 */
#define TIMER_COMPONENT_TYPE altera_avalon_timer
#define TIMER_COMPONENT_NAME timer
#define TIMER_BASE 0x1900000
#define TIMER_SPAN 32
#define TIMER_END 0x190001f
#define TIMER_IRQ 2
#define TIMER_ALWAYS_RUN 0
#define TIMER_FIXED_PERIOD 0
#define TIMER_SNAPSHOT 1
#define TIMER_PERIOD 1
#define TIMER_PERIOD_UNITS "ms"
#define TIMER_RESET_OUTPUT 0
#define TIMER_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_FREQ 65536000
#define TIMER_LOAD_VALUE 65535ULL
#define TIMER_COUNTER_SIZE 32
#define TIMER_MULT 0.0010
#define TIMER_TICKS_PER_SEC 1000

/*
 * Macros for device 'pio_o', class 'altera_avalon_pio'
 * The macros are prefixed with 'PIO_O_'.
 * The prefix is the slave descriptor.
 */
#define PIO_O_COMPONENT_TYPE altera_avalon_pio
#define PIO_O_COMPONENT_NAME pio_o
#define PIO_O_BASE 0x1900020
#define PIO_O_SPAN 16
#define PIO_O_END 0x190002f
#define PIO_O_DO_TEST_BENCH_WIRING 0
#define PIO_O_DRIVEN_SIM_VALUE 0x0
#define PIO_O_HAS_TRI 0
#define PIO_O_HAS_OUT 1
#define PIO_O_HAS_IN 0
#define PIO_O_CAPTURE 0
#define PIO_O_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_O_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_O_DATA_WIDTH 2
#define PIO_O_RESET_VALUE 0x0
#define PIO_O_EDGE_TYPE "NONE"
#define PIO_O_IRQ_TYPE "NONE"
#define PIO_O_FREQ 65536000

/*
 * Macros for device 'pio_i', class 'altera_avalon_pio'
 * The macros are prefixed with 'PIO_I_'.
 * The prefix is the slave descriptor.
 */
#define PIO_I_COMPONENT_TYPE altera_avalon_pio
#define PIO_I_COMPONENT_NAME pio_i
#define PIO_I_BASE 0x1900030
#define PIO_I_SPAN 16
#define PIO_I_END 0x190003f
#define PIO_I_DO_TEST_BENCH_WIRING 0
#define PIO_I_DRIVEN_SIM_VALUE 0x0
#define PIO_I_HAS_TRI 0
#define PIO_I_HAS_OUT 0
#define PIO_I_HAS_IN 1
#define PIO_I_CAPTURE 0
#define PIO_I_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_I_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_I_DATA_WIDTH 4
#define PIO_I_RESET_VALUE 0x0
#define PIO_I_EDGE_TYPE "NONE"
#define PIO_I_IRQ_TYPE "NONE"
#define PIO_I_FREQ 65536000

/*
 * Macros for device 'uart', class 'altera_avalon_uart'
 * The macros are prefixed with 'UART_'.
 * The prefix is the slave descriptor.
 */
#define UART_COMPONENT_TYPE altera_avalon_uart
#define UART_COMPONENT_NAME uart
#define UART_BASE 0x1900040
#define UART_SPAN 32
#define UART_END 0x190005f
#define UART_IRQ 3
#define UART_BAUD 115200
#define UART_DATA_BITS 8
#define UART_FIXED_BAUD 1
#define UART_PARITY 'N'
#define UART_STOP_BITS 1
#define UART_SYNC_REG_DEPTH 2
#define UART_USE_CTS_RTS 0
#define UART_USE_EOP_REGISTER 0
#define UART_SIM_TRUE_BAUD 0
#define UART_SIM_CHAR_STREAM ""
#define UART_FREQ 65536000

/*
 * Macros for device 'onewire', class 'sockit_owm'
 * The macros are prefixed with 'ONEWIRE_'.
 * The prefix is the slave descriptor.
 */
#define ONEWIRE_COMPONENT_TYPE sockit_owm
#define ONEWIRE_COMPONENT_NAME onewire
#define ONEWIRE_BASE 0x1900060
#define ONEWIRE_SPAN 8
#define ONEWIRE_END 0x1900067
#define ONEWIRE_IRQ 4
#define ONEWIRE_BTP_N "5.0"
#define ONEWIRE_BTP_O "1.0"
#define ONEWIRE_CDR_E 0
#define ONEWIRE_CDR_N 326
#define ONEWIRE_CDR_O 64
#define ONEWIRE_F_DLY 65672
#define ONEWIRE_OVD_E 1
#define ONEWIRE_OWN 1

/*
 * Macros for device 'sysid', class 'altera_avalon_sysid'
 * The macros are prefixed with 'SYSID_'.
 * The prefix is the slave descriptor.
 */
#define SYSID_COMPONENT_TYPE altera_avalon_sysid
#define SYSID_COMPONENT_NAME sysid
#define SYSID_BASE 0x1900068
#define SYSID_SPAN 8
#define SYSID_END 0x190006f
#define SYSID_ID 0
#define SYSID_TIMESTAMP 1305495565

/*
 * Macros for device 'ddr_sdram', class 'ddr_sdram_component_classic'
 * The macros are prefixed with 'DDR_SDRAM_'.
 * The prefix is the slave descriptor.
 */
#define DDR_SDRAM_COMPONENT_TYPE ddr_sdram_component_classic
#define DDR_SDRAM_COMPONENT_NAME ddr_sdram
#define DDR_SDRAM_BASE 0x10000000
#define DDR_SDRAM_SPAN 33554432
#define DDR_SDRAM_END 0x11ffffff
#define DDR_SDRAM_MEMORY_INFO_MEM_INIT_DATA_WIDTH 32
#define DDR_SDRAM_MEMORY_INFO_GENERATE_DAT_SYM 1
#define DDR_SDRAM_MEMORY_INFO_DAT_SYM_INSTALL_DIR SIM_DIR


#endif /* _ALTERA_ECS8_NIOS2_MMU_H_ */
