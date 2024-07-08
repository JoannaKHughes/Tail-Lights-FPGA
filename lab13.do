if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

### ---------------------------------------------- ###
### Compile code ###
### Enter files here; copy line for multiple files ###
vlog -sv -work work [pwd]/fsm.sv


### ---------------------------------------------- ###
### Load design for simulation ###
### Replace topLevelModule with the name of your top level module (no .sv) ###
### Do not duplicate! ###
vsim fsm

### ---------------------------------------------- ###
### Add waves here ###
### Use add wave * to see all signals ###
add wave CLOCK
add wave RESET
add wave LEFT
add wave RIGHT
add wave HAZ
add wave LIGHTS

###add wave smlout
###add wave instlab02_ex1/in1
###add wave instlab02_ex2/in2

### Force waves here ###
force CLOCK: 0 0, 1 100 -repeat 200
force RESET: 0 0
force LEFT: 0 0, 1 200, 0 1200
force RIGHT: 0 0, 1 1200, 0 2200
force HAZ: 0 0, 1 2200, 0 3200

### ---------------------------------------------- ###
### Run simulation ###
### Do not modify ###
# to see your design hierarchy and signals 
view structure 

# to see all signal names and current values
view signals
###virtual signal{in1 & in2}[groupSignalName]

### ---------------------------------------------- ###
### Edit run time ###
run 3200

### ---------------------------------------------- ###
### Will create large wave window and zoom to show all signals
view -undock wave
wave zoomfull 
