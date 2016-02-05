; Taz Mega Configuration G-Codes

M111 S0                             ; Debug off
;M111 S31				; Full debug.

;M575 P1 B57600 S1			;Force internal serial port baud rate.

M550 PTazMega			        ; Machine name (can be anything you like)
;M551 Ppassword                        ; Machine password (currently not used)
M551 P					;Disable password, not useful without SSL.
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xED ; MAC Address
;*** Adjust the IP address and gateway in the following 2 lines to suit your network
;M552 P0.0.0.0						; IP address (0 = use DHCP)
M552 P192.168.50.215						; IP address (0 = use DHCP)
M554 P192.168.50.1                   ; Gateway
M553 P255.255.255.0                 ; Netmask

M555 P2                             ; Set output to look like Marlin
G21                                 ; Work in millimetres
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves

; steps/mm
M92 X400
M92 Y400
M92 Z400


M569 P0 S1 		;X Reverse
M569 P1 S1 		;Y Reverse
M569 P2 S0 		;Z Normal

M906 X1500 Y1500 Z3000			; Set motor currents (mA)
M906 I95				; IDLE motor current percentage (100=full)
M84 S0					; NEVER timeout stepper motors
M85 S0					; NEVER timeout stepper motors

M201 X2750 Y2750 Z25			; Max acceleration. Tested limits: X10000 Y10000
M203 X6000 Y6000 Z900			; Max speed. Absolute limits are X6000 Y6000 Z2700.

M574 X1 Y1 Z2 S0	;Endstops.
M666 X0.00 Y0.00 Z0.00	;Endstop adjustments.

;Probe Defaults
M558 P1 X0 Y0 Z1
;G31 C0 P500 X0 Y0 Z1		; Probe at [X/Y], no Z temperature coefficient, Z=1 when probe=500.

;M556 S78 X0 Y0 Z0         	        ; Axis compensation

M208 X555 Y415 Z147.5	; default max travel. IMPORTANT: Z travel range permits tool crashes.

M106 I0			; Do not "invert" fans (S2=min, S253=full)

;----------
;Heated bed configuration.

M305 P0 T100000 B3794 R4700 H30 L0	;Thermistor.

;----------
;Extruder Tool configuration.

M570 S180				; hotend warmup wait time

; Extruder Thermistors, hexagon hotend "104NT-4-R025H42G". The "P" parameter does NOT follow the tool numbering.
;Duet 0.85, 4.7k resistors.
M305 P1 T100000 B4267 R4700 H30 L0
M305 P2 T100000 B4267 R4700 H30 L0

;Duex 4, 1k resistors.
M305 P3 T100000 B4267 R1000 H37 L0
M305 P4 T100000 B4267 R1000 H37 L0

; Extruder Steppers.
M906 E1500:1500:1500:1500		; Extruder motor current.
M92 E968:866:866:866			; steps/mm, first extruder is flexystruder
M201 E2000:2000:2000:2000		; acceleration
;M203 E:50:50:50:50			; speed
M203 E:2000:2000:2000:2000			; speed - allow fast retraction

;Extruder Stepper Direction.
M569 P3 S0
M569 P4 S0
M569 P5 S0
M569 P6 S0
M569 P7 S0
M569 P8 S0

; Extruder Tool Definitions
M563 P0 D0 H1				; tool 0, drive 0, heater 1
M301 H1 P35 I0.25 D100			; Hexagon hotend PID settings. Periodic pulses from the Duex board necessitates extra resistance to disturbance.
;G10 P0 R80 S165 X-50.6 Y-38.1 Z0	; tool 0, standbyTemp 125, runTemp 165 (defaults)

M563 P1 D1 H2
M301 H2 P35 I0.25 D100
;G10 P1 R80 S165 X-118.1 Y-15.65 Z0

M563 P2 D2 H3
M301 H3 P35 I0.25 D100
;G10 P2 R80 S165 X-52.35 Y-139.45 Z0

;M563 P3 D3 H4
M563 P3 D5 H4	;Swap drive to accomodate degraded chip.
M301 H4 P35 I0.25 D100
;G10 P3 R80 S165 X-116.35 Y-136.85 Z0

M106 P1 S0 ; Part cooling fan off.

;----------
;Special Tool configuration.

;Laser. No heater, unused drive.
M563 P4 D4
;G10 P4 R-273.15 S-273.15 X69.2 Y-4.85 Z0
M106 P0 S0 ; Laser power off.

;CNC Spindle. No heater, unused drive.
;M563 P5 D5
M563 P5 D3	;Swap drive to accomodate degraded chip.
;G10 P5 R-273.15 S-273.15 X-207.6 Y4.8 Z0


;Tool/probe definitions based on spreadsheet alignment data.
;G31 C0 P500 X40.8 Y8.7 Z1.5					;@35C
;G31 C0 P500 X40.8 Y8.7 Z1.675					;@120C

G31 C0.0035 P500 X40.8 Y8.7 Z1.75				;@0C

G10 P0 R80 S165 X-51.985 Y-0.48 Z0
G10 P1 R80 S165 X-73.79 Y-0.87 Z0
G10 P2 R80 S165 X-96.15 Y-0.9 Z0
G10 P3 R80 S165 X-118.45 Y-0.9 Z0
G10 P4 R-273.15 S-273.15 X-89.1 Y-62.1 Z0
G10 P5 R-273.15 S-273.15 X-0.35 Y-47.2 Z0









