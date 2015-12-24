
M561	;Zero existing compensation.

;Always evacuate Z-Axis first, avoid breaking milling bits.

G91
G1 Z0.5 F30 S1	;Enable motors slowly to prevent slippage.
G1 Z1000 F2700 S1
G90

G28 X
G28 Y

G28 Z

;Approximately center tools, prevent Z-axis shifting.
G1 X200 F5100 S0

;Move Y-axis tooling out of the way for safety.
G0 Y225 F5100 S0
