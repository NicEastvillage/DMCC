# Tick the timer
execute if score $enabled timer matches 1 run scoreboard players remove $ticks timer 1
scoreboard players operation $seconds timer = $ticks timer
scoreboard players operation $seconds timer += $20 const
scoreboard players operation $seconds timer /= $20 const
scoreboard players operation $minutes timer = $seconds timer
scoreboard players operation $minutes timer /= $60 const
scoreboard players operation $mod_ticks timer = $ticks timer
scoreboard players operation $mod_ticks timer %= $20 const
scoreboard players operation $mod_seconds timer = $seconds timer
scoreboard players operation $mod_seconds timer %= $60 const
scoreboard players operation $countdown_ticks timer = $ticks timer
scoreboard players operation $countdown_ticks timer %= $game_dur timer
scoreboard players operation $countdown_seconds timer = $countdown_ticks timer
scoreboard players operation $countdown_seconds timer += $20 const
scoreboard players operation $countdown_seconds timer /= $20 const

# Show countdown time as title
execute if score $ticks timer > $game_dur timer run title @a title [{"score":{"name":"$countdown_seconds","objective":"timer"}}]

# Make tick sounds during countdown
execute if score $ticks timer > $game_dur timer if score $mod_ticks timer matches 0 if score $countdown_ticks timer matches 2.. run playsound minecraft:block.lever.click ambient @a ~ ~-100 ~ 1 1 1
execute if score $ticks timer >= $game_dur timer if score $mod_ticks timer matches 0 if score $countdown_ticks timer matches ..2 run playsound entity.arrow.hit_player ambient @a ~ ~-100 ~ 1 0.6 1

# Make tick sounds when time is running out
execute if score $ticks timer < $game_dur timer if score $mod_ticks timer matches 0 if score $ticks timer matches 2..200 run playsound minecraft:block.lever.click ambient @a ~ ~-100 ~ 1 1 1
execute if score $enabled timer matches 1 if score $ticks timer < $game_dur timer if score $mod_ticks timer matches 0 if score $ticks timer matches ..2 run playsound minecraft:block.anvil.land ambient @a ~ ~-100 ~ 1 0.1 1

# Show time in actionbar
execute if score $ticks timer < $game_dur timer if score $ticks timer matches 1.. run title @a reset
execute if score $ticks timer < $game_dur timer if score $ticks timer matches 1.. run title @a times 0 20 0
execute if score $ticks timer < $game_dur timer if score $ticks timer matches 1.. run title @a actionbar [{"score":{"name":"$minutes","objective":"timer"}},{"text":"m "},{"score":{"name":"$mod_seconds","objective":"timer"}},{"text":"s"}]


# Disable when hitting 0
execute if score $ticks timer matches 0 run title @a actionbar "Game over"
execute if score $ticks timer matches 0 run scoreboard players set $enabled timer 0
