G91                ; relative mode
G1 X350 F3000 S1   ; move up to 240mm in the +X direction, stopping if the homing switch is triggered
G1 X-4 F600        ; move slowly 4mm in the -X direction
G1 X10 S1          ; move slowly 10mm in the +X direction, stopping at the homing switch
G90                ; back to absolute mode