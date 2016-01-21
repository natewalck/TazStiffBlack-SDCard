;Run by G32

;Zsafe>=25

T99	;Non-existant tool, no offset.
M561	;Zero existing compensation.

;Goto Center. Unlike other points, this should include compensation for probe X/Y coordinates.
G0 Z25
G0 X213.2 Y135.3
G30

G0 Z25
M98 P/macros/cc_topLeft
G30 P0 Z-10000

G0 Z25
M98 P/macros/cd_topRight
G30 P1 Z-10000

G0 Z25
M98 P/macros/ce_bottomRight
G30 P2 Z-10000

G0 Z25
M98 P/macros/cf_bottomLeft
;G30 P3 S0 Z-10000	;Calibrate with same number of factors as points probed.
;G30 P3 S4 Z-10000	;Four factor calibration.
G30 P3 S3 Z-10000	;Three factor calibration.
;G30 P3 S-1 Z-10000	;Simply report coordinates.

;Pause for UI.
G4 P1500

;Return to safe position.
G0 Z25
M98 P/macros/cb_center


