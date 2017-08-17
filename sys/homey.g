G91                ; relative mode
G1 Y-1000 F5100 S1 ; move up to 1000mm in the -Y direction, stopping if the homing switch is triggered
G1 Y3 F360 S0      ; move slowly 3mm in the +Y direction
G1 Y-3 F180 S1     ; move slowly 3mm in the -Y direction, stopping at the homing switch
G90                ; back to absolute mode
