###########################################################################
#
# Generated by : Version 10.1 Build 197 01/19/2011 Service Pack 1 SJ Web Edition
#
# Project      : ecs8_nios2_dbg
# Revision     : ecs8_nios2_dbg
#
# Date         : Thu Apr 28 22:40:39 CEST 2011
#
###########################################################################
 
 
# WARNING: Expected ENABLE_CLOCK_LATENCY to be set to 'ON', but it is set to 'OFF'
#          In SDC, create_generated_clock auto-generates clock latency
#
# ------------------------------------------
#
# Create generated clocks based on PLLs
derive_pll_clocks -use_tan_name
#
# ------------------------------------------


# Original Clock Setting Name: clk
create_clock -period "30.517 ns" \
             -name {clk} {clk}
# ---------------------------------------------

# ** Clock Latency
#    -------------

# ** Clock Uncertainty
#    -----------------

# ** Multicycles
#    -----------
# ** Cuts
#    ----
# QSF: -name CUT ON -from ddr_dqs[0] -to *
set_false_path -from [get_keepers {ddr_dqs[0]}] -to [get_keepers *]
# QSF: -name CUT ON -from ddr_dqs[1] -to *
set_false_path -from [get_keepers {ddr_dqs[1]}] -to [get_keepers *]

# ** Input/Output Delays
#    -------------------




# ** Tpd requirements
#    ----------------
# QSF: -name TPD_REQUIREMENT 3.6 ns -from *dq_enable* -to *
set_max_delay 3.6 -from [get_ports {*dq_enable*}] -to [get_ports *]
# QSF: -name TPD_REQUIREMENT 1.7 ns -from *input_* -to *resynched_data*
set_max_delay 1.7 -from [get_ports {*input_*}] -to [get_ports {*resynched_data*}]

# ** Setup/Hold Relationships
#    ------------------------

# ** Tsu/Th requirements
#    -------------------


# ** Tco/MinTco requirements
#    -----------------------
# --------------
# Represent unkown external clock as N/C (Not a Clock)
create_clock -name "N/C" -period 10.0
# --------------
# QSF: -name TCO_REQUIREMENT 6 ns -from  -to ddr_ck_p
set_output_delay 0.0 -clock "N/C" [get_ports {ddr_ck_p[*]}]
set_max_delay 6 -to [get_ports {ddr_ck_p[*]}]
# QSF: -name TCO_REQUIREMENT 6 ns -from  -to ddr_ck_n
set_output_delay 0.0 -clock "N/C" [get_ports {ddr_ck_n[*]}]
set_max_delay 6 -to [get_ports {ddr_ck_n[*]}]



# ---------------------------------------------

