function timer:start

gamemode adventure @a[gamemode=!spectator] 
team join players @a[gamemode=adventure]

scoreboard players set @a[team=players] laps 0
scoreboard players set @a[team=players] stage 0

scoreboard objectives setdisplay list laps
scoreboard objectives setdisplay belowName laps
scoreboard objectives setdisplay sidebar stage

clear @a
give @a minecraft:warped_fungus_on_a_stick
execute as @a[team=players] run function game:return_to_last_checkpoint
