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
G0 Z25
G0 X132.5 Y182.5
G30

G0 Z25
G0 X0 Y50
G30 P0 S-1 Z-10000

G0 Z25
G0 X265 Y50
G30 P1 S-1 Z-10000

G0 Z25
G0 X265 Y315
G30 P2 S-1 Z-10000

G0 Z25
G0 X0 Y315
G30 P3 S-1 Z-10000

;Pause for UI.
G4 P1500

;Return to safe position.
G0 Z25
G0 X200 Y225


