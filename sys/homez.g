G91               ; relative mode
G1 Z0.5 F30 S1    ; Enable motors slowly to prevent slippage.
G1 Z1000 F2700 S1 ; move up to 1000mm in the +Z direction, stopping if the homing switch is triggered
G1 Z-3 F2700 S0   ; move slowly 3mm in the -Z direction
G1 Z3 F300 S1     ; move slowly 3mm in the +Z direction, stopping at the homing switch
G90               ; back to absolute mode

M208 Z147.5       ; Set limit to prevent stupid mistakes
