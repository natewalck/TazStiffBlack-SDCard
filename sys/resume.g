; resume.g
; called before a print from SD card is resumed

G1 R1 Z5 F5000	; move to 2mm above resume point
G1 R1			; lower nozzle to resume point
G1 E4 F1200		; undo the retraction
