
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name lab03 -dir "C:/Documents and Settings/lab03/planAhead_run_2" -part xc3s500efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Documents and Settings/lab03/seg7_decoder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Documents and Settings/lab03} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "seg7_constrain.ucf"
add_files "seg7_constrain.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
