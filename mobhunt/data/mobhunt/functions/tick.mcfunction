# During setup stuff
execute if score $enabled timer matches 0 run effect give @a minecraft:saturation 2 0 true
execute if score $enabled timer matches 0 run team join players @a

# Release players 
execute if score $enabled timer matches 1 if score $ticks timer matches 1.. if score $countdown_ticks timer matches 1 run function mobhunt:release_players

# Game over
execute if score $enabled timer matches 1 if score $ticks timer matches 1 run function mobhunt:game_over

# Update timer during play
execute if score $enabled timer matches 1 run function mobhunt:tick_timer
