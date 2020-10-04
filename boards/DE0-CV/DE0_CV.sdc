#**************************************************************
# This .sdc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period "50.0 MHz" [get_ports CLOCK_50]
#create_clock -period "50.0 MHz" [get_ports CLOCK2_50]
#create_clock -period "50.0 MHz" [get_ports CLOCK3_50]
#create_clock -period "50.0 MHz" [get_ports CLOCK4_50]

#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks

create_generated_clock -name CLK_PCK -source [get_pins {CLK_PCK|clk}] -divide_by 2 [get_pins {CLK_PCK|q}]

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************
set_false_path -from [get_ports {RESET_N}]
set_false_path -from [get_ports {COIN_SW_N}]
set_false_path -from [get_ports {SW1A}]
set_false_path -from [get_ports {SW1B}]
set_false_path -from [get_ports {PAD1_OUT}]
set_false_path -from [get_ports {PAD2_OUT}]

set_false_path -to [get_ports {CSYNC}]
set_false_path -to [get_ports {VIDEO}]
set_false_path -to [get_ports {SCORE}]
set_false_path -to [get_ports {PAD_TRG_N}]
set_false_path -to [get_ports {SOUND}]

set_false_path -from [get_keepers {reset_sync:reset_sync|q2}]

#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************



