; Taz Mega Configuration G-Codes

M111 S0                             ; Debug off
;M111 S31				; Full debug.

;M575 P1 B57600 S1			;Force internal serial port baud rate.

M550 PTazStiffBlack                 ; Machine name (can be anything you like)
;M551 Ppassword                     ; Machine password (currently not used)
M551 P					            ;Disable password, not useful without SSL.
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xED ; MAC Address
;*** Adjust the IP address and gateway in the following 2 lines to suit your network
;M552 P0.0.0.0						; IP address (0 = use DHCP)
M552 P192.168.1.30					; IP address (0 = use DHCP)
M554 P192.168.1.1                   ; Gateway
M553 P255.255.255.0                 ; Netmask

M555 P2                             ; Set output to look like Marlin
G21                                 ; Work in millimetres
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves

; steps/mm
M92 X100
M92 Y100
M92 Z400

; Axis stepper direction
M569 P0 S0 		;X Normal
M569 P1 S1 		;Y Reverse
M569 P2 S0 		;Z Normal

M906 X1350 Y1350 Z2000			; Set motor currents (mA)
M906 I95				; IDLE motor current percentage (100=full)
M84 S0					; NEVER timeout stepper motors
M85 S0					; NEVER timeout stepper motors

M201 X2750 Y2750 Z25		; Max acceleration. Tested limits: X10000 Y10000
M566 X900 Y900				; Max jerk. Tested limits: X3500 Y3500
M203 X36000 Y36000 Z900		; Max speed. Absolute limits are X6000 Y6000 Z2700.

M574 X2 Y1 Z2 S1	    ;Endstops. X Left High, Y Front Low, Z Top High
M666 X0.00 Y0.00 Z0.00	;Endstop adjustments.

;Probe Defaults
M558 P1 X0 Y0 Z1 H3 F200 T5000  ; smart IR Z probe, used for homing Z axis only, dive height 3mm, probe speed 200mm/min, travel speed 5000mm/min
G31 C0 P500 X33.4 Y-17 Z0		; Probe at [X/Y], no Z temperature coefficient, Z=1 when probe=500.

;M556 S78 X0 Y0 Z0         	        ; Axis compensation

M208 X395 Y126 Z147.5	; default max travel. IMPORTANT: Z travel range permits tool crashes.

M106 I0			; Do not "invert" fans (S2=min, S253=full)

;----------
;Heated bed configuration.
;----------

M305 P0 T100000 B3794 R4700 H30 L0	;Thermistor.

;----------
;Extruder Tool configuration.
;----------

M570 S180				; hotend warmup wait time

; Extruder Thermistors, hexagon hotend "104NT-4-R025H42G". The "P" parameter does NOT follow the tool numbering.
;Duet 0.85, 4.7k resistors.
M305 P1 T100000 B4267 R4700 H30 L0

; Extruder Steppers.
M906 E1500  ; Extruder motor current.
M92 E750   ; steps/mm
M201 E2000  ; acceleration
M203 E1200  ; speed - allow fast retraction

;Extruder Stepper Direction.
M569 P3 S0
M569 P4 S0
M569 P5 S0
M569 P6 S0
M569 P7 S0
M569 P8 S0

; Extruder Tool Definitions
M563 P0 D0 H1				; tool 0, drive 0, heater 1
M301 H1 P45 I0.35 D100			; Hexagon hotend PID settings. Periodic pulses from the Duex board necessitates extra resistance to disturbance.
;G10 P0 R80 S165 X-50.6 Y-38.1 Z0	; tool 0, standbyTemp 125, runTemp 165 (defaults)

M106 P1 S0 ; Part cooling fan off.

;Where probe is relative to X/Y and at what Z distance the probe triggers
;How much the trigger distance varies with temperature (C0.0035)
;What analog value the Duet will read when the probe triggers (P500)
;G31 C0 P500 X33.4 Y-17 Z1.575
; Load probe config from a macro
M98 P/macros/probe_config.g

; Calibration data goes here
;G10 P0 R80 S165 X0 Y0 Z0
;G10 P1 R80 S165 X0 Y0 Z0
;G10 P2 R80 S165 X0 Y0 Z0
;G10 P3 R80 S165 X0 Y0 Z0
;G10 P4 R-273.15 S-273.15 X0 Y0 Z0
;G10 P5 R-273.15 S-273.15 X0 Y0 Z0