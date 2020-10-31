# run the timer
execute if score $enabled timer matches 1 run scoreboard players add $ticks timer 1
scoreboard players operation $seconds timer = $ticks timer
scoreboard players operation $seconds timer /= $const_20 const
scoreboard players operation $minutes timer = $seconds timer
scoreboard players operation $minutes timer /= $const_60 const
scoreboard players operation $mod_seconds timer = $seconds timer
scoreboard players operation $mod_seconds timer %= $const_60 const

# show time in actionbar
execute if score $ticks timer matches 1.. run title @a actionbar [{"score":{"name":"$minutes","objective":"timer"}},{"text":"m "},{"score":{"name":"$mod_seconds","objective":"timer"}},{"text":"s"}]
