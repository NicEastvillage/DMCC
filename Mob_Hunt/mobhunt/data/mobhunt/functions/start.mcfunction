scoreboard players set @a points 0

# Start timer
title @a times 0 20 0
scoreboard players set $ticks timer 0
scoreboard players operation $ticks timer += $game_dur timer
scoreboard players operation $ticks timer += $countdown_dur timer
scoreboard players set $enabled timer 1
