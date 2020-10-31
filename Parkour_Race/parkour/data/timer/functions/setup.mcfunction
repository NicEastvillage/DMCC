# run setup for timer

# create timer variables
scoreboard objectives remove timer
scoreboard objectives add timer dummy
scoreboard players set $enabled timer 0
scoreboard players set $ticks timer 0
scoreboard players set $seconds timer 0
scoreboard players set $minutes timer 0
scoreboard players set $mod_seconds timer 0

# create constants
scoreboard objectives remove const
scoreboard objectives add const dummy
# scoreboard players set $const_0 const 0
scoreboard players set $const_20 const 20
scoreboard players set $const_60 const 60
scoreboard players set $const_50 const 50
scoreboard players set $const_-50 const -50

# reset title
title @a reset
title @a times 0 40 0
