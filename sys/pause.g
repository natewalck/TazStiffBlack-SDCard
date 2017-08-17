; pause.g
; called when a print from SD card is paused

M83             ; relative extruder moves
G1 E-4 F1200    ; retract 4mm
G91             ; relative moves
G1 Z5 F5000     ; raise nozzle 5mm
G90             ; absolute moves
G1 X0 Y85 F5000 ; move head out of the way of the print
