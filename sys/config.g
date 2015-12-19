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

M906 X1500 Y3000 Z3000			; Set motor currents (mA)
M906 I95				; IDLE motor current percentage (100=full)
M84 S0					; NEVER timeout stepper motors
M85 S0					; NEVER timeout stepper motors

M201 X1250 Y1250 Z25			; Max acceleration.
M203 X6000 Y6000 Z900			; Max speed. Absolute limits are X6000 Y6000 Z2700.

M574 X1 Y1 Z2 S0	;Endstops.
M666 X0.00 Y0.00 Z0.00	;Endstop adjustments.

;Probe Defaults
M558 P1 X0 Y0 Z1
G31 X0 Y0 Z1.0 C0 P500		; Probe at X0/Y0, no Z temperature coefficient, Z=1 when probe=500.

;M556 S78 X0 Y0 Z0         	        ; Axis compensation

M208 X670 Y375 Z165	; default max travel

;M106 I1			; "invert" fans (S2=min, S253=full)

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
M305 P3 T100000 B4267 R1000 H30 L0
M305 P4 T100000 B4267 R1000 H30 L0

; Extruder Steppers.
M906 E1500:1500:1500:1500		; Extruder motor current.
M92 E968:866:866:866			; steps/mm, first extruder is flexystruder
M201 E2000:2000:2000:2000		; acceleration
M203 E:2500:2500:2500:2500		; speed

; Extruder Tool Definitions
M563 P0 D0 H1				; tool 0, drive 0, heater 1
G10 P0 X0 Y0 Z0 S0 R0			; tool 0, standbyTemp 0, runTemp 0

M563 P1 D1 H2
G10 P1 X0 Y0 Z0 S0 R0

M563 P2 D2 H3
G10 P2 X0 Y0 Z0 S0 R0

M563 P3 D3 H4
G10 P3 X0 Y0 Z0 S0 R0

M106 P1 S0 ; Part cooling fan off.

;----------
;Special Tool configuration.

;Laser. No heater, unused drive.
M563 P4 D4
G10 P4 X0 Y0 Z0 R-273.15 S-273.15
M106 P0 S0 ; Laser power off.

;CNC Spindle. No heater, unused drive.
M563 P5 D5
G10 P5 X0 Y0 Z0 R-273.15 S-273.15









