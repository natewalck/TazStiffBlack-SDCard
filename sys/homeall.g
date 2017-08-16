
M561	;Zero existing compensation.

; X Axis
G91                ; relative mode
G1 X350 F3000 S1   ; move up to 240mm in the +X direction, stopping if the homing switch is triggered
G1 X-4 F600        ; move slowly 4mm in the -X direction
G1 X10 S1          ; move slowly 10mm in the +X direction, stopping at the homing switch
G90                ; back to absolute mode

; Y Axis
G91
G1 Y-1000 F5100 S1
G1 Y3 F360 S0
G1 Y-3 F180 S1
G90

; Z Axis
G91
G1 Z0.5 F30 S1	;Enable motors slowly to prevent slippage.
G1 Z1000 F2700 S1
G1 Z-3 F2700 S0
G1 Z3 F300 S1
G90

M208 Z147.5 ; Set limit to prevent stupid mistakes