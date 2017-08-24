; bed.g
; called to perform automatic bed compensation via G32
;

;T99    ;Non-existant tool, no offset.
; Clear any bed transform
M561

; Home all axes
G28

;Goto Center. Unlike other points, this should include compensation for probe X/Y coordinates.
G0 Z35
G0 X143 Y63.5
G30

G0 Z35
M98 P/macros/cd_topRight
G30 P0 Z-10000

G0 Z35
M98 P/macros/ce_bottomRight
G30 P1 Z-10000

G0 Z35
M98 P/macros/cf_bottomLeft
G30 P2 Z-10000

G0 Z35
M98 P/macros/cc_topLeft
;G30 P3 S0 Z-10000  ;Calibrate with same number of factors as points probed.
;G30 P3 S4 Z-10000  ;Four factor calibration.
G30 P3 S4 Z-10000  ;Three factor calibration.
;G30 P3 S-1 Z-10000 ;Simply report coordinates.

;Pause for UI.
G4 P1500

;Return to safe position.
G0 Z35
M98 P/macros/cb_center
