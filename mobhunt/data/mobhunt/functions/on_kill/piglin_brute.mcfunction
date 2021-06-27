
### THIS FILE IS GENERATED

advancement revoke @s only mobhunt:kill/piglin_brute

# Announce killing
execute unless score $anyone piglin_brutes matches 1 run tellraw @a [{"selector":"@s","color":"green"},{"text":" was first to kill a ","color":"gold"},{"text":"piglin brute","color":"blue"},{"text":" (+45, +15)","color":"green"}]
execute if score $anyone piglin_brutes matches 1 unless score @s piglin_brutes matches 1.. run tellraw @a [{"selector":"@s","color":"green"},{"text":" killed a ","color":"yellow"},{"text":"piglin brute","color":"blue"},{"text":" (+45)","color":"green"}]

# Add points
execute unless score $anyone piglin_brutes matches 1.. run scoreboard players add @s points 15
execute unless score @s piglin_brutes matches 1.. run scoreboard players add @s points 45
execute if score @s piglin_brutes matches 1.. run scoreboard players add @s points 2

# Register that the mob has been killed
execute unless score $anyone piglin_brutes matches 1 run scoreboard players set $anyone piglin_brutes 1

