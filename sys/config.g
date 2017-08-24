; TazStiffBlack Configuration G-Codes

; General Preferences
M111 S0                  ; Debug off
G21                      ; Work in millimetres
G90                      ; Send absolute coordinates...
M83                      ; ...but relative extruder moves
M555 P2                  ; Set firmware compatibility to look like Marlin
M208 X0 Y0 Z0 S1         ; Set axis minima
M208 X365 Y240 Z147.5 S0 ; Set axis maxima
;M575 P1 B57600 S1		 ;Force internal serial port baud rate.

; Endstops
M574 X2 Y1 Z2 S1                ; Define active low and unused microswitches
M666 X0.00 Y0.00 Z0.00          ; Endstop Adjustments
M558 P1 X0 Y0 Z1 H3 F200 T5000  ; Set Z probe type to modulated, the axes for which it is used and the probe + travel speeds
G31 C0 P500 X39.5 Y56.5 Z1.42 ; Set Z probe trigger value, offset and trigger height
M557 X15:350 Y15:225 S20        ; Define mesh grid

; Drives
; Axis stepper direction
M569 P0 S0                       ; X Normal
M569 P1 S1                       ; Y Reverse
M569 P2 S0                       ; Z Normal
M569 P3 S0                       ; Extruder
M92 X114.29 Y114.29 Z400 E750    ; Set steps per mm
M566 X900 Y900 Z12 E120          ; Set maximum instantaneous speed changes (mm/min)
M203 X36000 Y36000 Z900 E1200    ; Set maximum speeds (mm/min)
M201 X2750 Y2750 Z25 E2000       ; Set accelerations (mm/s^2)
M906 X1350 Y1350 Z2000 E1500 I95 ; Set motor currents (mA) and motor idle factor in per cent
M84 S0                           ; Set idle timeout
M85 S0                           ; NEVER timeout stepper motors

; Heaters
M143 S260                             ; Set maximum heater temperature to 260C
M305 P0 T100000 B3794 C0 R4700 H30 L0 ; Set thermistor + ADC parameters for heater 0 - Heared Bed
M305 P1 T100000 B4267 C0 R4700 H30 L0 ; Set thermistor + ADC parameters for heater 1 - Hotend

; Tools
M563 P0 D0 H1   ; Define tool 0
G10 P0 X0 Y0 Z0 ; Set tool 0 axis offsets
G10 P0 R0 S0    ; Set initial tool 0 active and standby temperatures to 0C

; Network
M550 PTazStiffBlack     ; Machine name (can be anything you like)
M540 PBE:EF:DE:AD:FE:ED ; Set MAC address
M552 P192.168.7.30 S1   ; IP address (0 = use DHCP)
M554 P192.168.1.1       ; Gateway
M553 P255.255.255.0     ; Netmask
M586 P0 S1              ; Enable HTTP
M586 P1 S0              ; Disable FTP
M586 P2 S0              ; Disable Telnet

; Fans
M106 P0 S0.3 I0 F500 H-1  ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off - Hotend
M106 P1 S0 I0 F500 H1 T45 ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on - Part Cooling


; Additional Options
M570 S180             ; hotend warmup wait time
301 H1 P45 I0.35 D100 ; Hexagon hotend PID settings. Periodic pulses from the Duex board necessitates extra resistance to disturbance.

; Load probe config from a macro
M98 P/macros/probe_config.g
