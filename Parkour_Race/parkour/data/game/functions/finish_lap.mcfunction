particle minecraft:dragon_breath ~ ~ ~ 0 0 0 0.1 100 force
scoreboard players set @s stage 0
scoreboard players add @s laps 1

# announce lap number
execute if score @s laps matches 1 run tellraw @a [{"text":"["},{"score":{"name":"$minutes","objective":"timer"}},{"text":"m "},{"score":{"name":"$mod_seconds","objective":"timer"}},{"text":"s]"}, {"selector":"@s","bold":true}, {"text":" finished their "}, {"text": "1st", "bold":true}, {"text": " lap!"}]
execute if score @s laps matches 2 run tellraw @a [{"text":"["},{"score":{"name":"$minutes","objective":"timer"}},{"text":"m "},{"score":{"name":"$mod_seconds","objective":"timer"}},{"text":"s]"}, {"selector":"@s","bold":true}, {"text":" finished their "}, {"text": "2nd", "bold":true}, {"text": " lap!"}]
execute if score @s laps matches 3 run tellraw @a [{"text":"["},{"score":{"name":"$minutes","objective":"timer"}},{"text":"m "},{"score":{"name":"$mod_seconds","objective":"timer"}},{"text":"s]"}, {"selector":"@s","bold":true}, {"text":" finished their "}, {"text": "last", "bold":true}, {"text": " lap!"}]

# put the final time in a times scoreboard
execute if score @s laps matches 3 store result score @s times run scoreboard players get $ticks timer
# remove player from players and put them into spectate
execute if score @s laps matches 3 run team leave @s
execute if score @s laps matches 3 run gamemode spectator @s
