
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name lab03 -dir "D:/VHDL/lab03/planAhead_run_1" -part xc3s500efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/VHDL/lab03/seg7_decoder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/VHDL/lab03} }
set_param project.paUcfFile  "seg7_constrain.ucf"
add_files "seg7_constrain.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
