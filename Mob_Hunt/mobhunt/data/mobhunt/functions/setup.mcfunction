
# Constants
scoreboard objectives add const dummy
scoreboard players set $20 const 20
scoreboard players set $60 const 60

# Points
scoreboard objectives add points dummy "Points"
scoreboard players reset * points
scoreboard players set @a points 0
scoreboard objectives setdisplay sidebar points

function mobhunt:setup_mob_scores

# Timer
scoreboard objectives add timer dummy
scoreboard players set $enabled timer 0
scoreboard players set $ticks timer 0
scoreboard players set $seconds timer 0
scoreboard players set $minutes timer 0
scoreboard players set $mod_ticks timer 0
scoreboard players set $mod_seconds timer 0
scoreboard players set $countdown_ticks timer 0
scoreboard players set $countdown_seconds timer 0
scoreboard players set $game_dur timer 19200
scoreboard players set $countdown_dur timer 200

# Team
team add players
team join players @a
team modify players friendlyFire false

gamemode adventure @a

# Spawn area
fill ~-4 ~-1 ~-4 ~4 ~4 ~4 minecraft:glass hollow
fill ~-4 ~-1 ~-4 ~4 ~-1 ~4 minecraft:obsidian
tp @a @s
setworldspawn ~ ~ ~
spawnpoint @a ~ ~ ~
gamerule spawnRadius 0
clear @a
kill @e[tag=spawn]
summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["spawn"]}
