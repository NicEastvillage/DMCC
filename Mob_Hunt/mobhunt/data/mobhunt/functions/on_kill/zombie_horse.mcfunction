
### THIS FILE IS GENERATED

advancement revoke @s only mobhunt:kill/zombie_horse

# Announce killing
execute unless score $anyone zombie_horses matches 1 run tellraw @a [{"selector":"@s","color":"green"},{"text":" was first to kill a ","color":"gold"},{"text":"zombie horse","color":"light_purple"},{"text":" (+100, +15)","color":"green"}]
execute if score $anyone zombie_horses matches 1 unless score @s zombie_horses matches 1.. run tellraw @a [{"selector":"@s","color":"green"},{"text":" killed a ","color":"yellow"},{"text":"zombie horse","color":"light_purple"},{"text":" (+100)","color":"green"}]

# Add points
execute unless score $anyone zombie_horses matches 1.. run scoreboard players add @s points 15
execute unless score @s zombie_horses matches 1.. run scoreboard players add @s points 100
execute if score @s zombie_horses matches 1.. run scoreboard players add @s points 2

# Register that the mob has been killed
execute unless score $anyone zombie_horses matches 1 run scoreboard players set $anyone zombie_horses 1

