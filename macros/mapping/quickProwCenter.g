
M114

; Turn off probe x and y offsets to make probing easier
M98 P/macros/probe_noxy.g

G90
G0 X50
G30 P0 S-1 Z-10000


G91


G0 X40
G30 P0 S-1 Z-10000

G0 X40
G30 P0 S-1 Z-10000

G0 X40
G30 P0 S-1 Z-10000

G0 X40
G30 P0 S-1 Z-10000

G0 X40
G30 P0 S-1 Z-10000

G0 X40
G30 P0 S-1 Z-10000

; Revert to default probe settings
M98 P/macros/probe_config.g

G90
G0 X50
