;Run by G32

;Ztable<=5

;Zsafe>=25

;Xmin=0
;Xmax=265

;Ymin=50
;Ymax=315

;Xcenter=132.5
;Ycenter=182.5

M561	;Zero existing compensation.
G31 X0 Y0 Z1.3 C0 P500		; Probe at X0/Y0, no Z temperature coefficient, Z=1 when probe=500.

G0 Z25
G0 X132.5 Y182.5
G30

G0 Z25
G0 X0 Y50
G30 P0 Z-10000

G0 Z25
G0 X0 Y315
G30 P1 Z-10000

G0 Z25
G0 X265 Y315
G30 P2 Z-10000

G0 Z25
G0 X265 Y50
G30 P3 S0 Z-10000

;Pause for UI.
G4 P1500

;Return to safe position.
G0 Z25
G0 X200 Y225


