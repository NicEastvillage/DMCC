
### THIS FILE IS GENERATED

advancement revoke @s only mobhunt:kill/blaze

# Announce killing
execute unless score $anyone blazes matches 1 run tellraw @a [{"selector":"@s","color":"green"},{"text":" was first to kill a ","color":"gold"},{"text":"blaze","color":"blue"},{"text":" (+45, +15)","color":"green"}]
execute if score $anyone blazes matches 1 unless score @s blazes matches 1.. run tellraw @a [{"selector":"@s","color":"green"},{"text":" killed a ","color":"yellow"},{"text":"blaze","color":"blue"},{"text":" (+45)","color":"green"}]

# Add points
execute unless score $anyone blazes matches 1.. run scoreboard players add @s points 15
execute unless score @s blazes matches 1.. run scoreboard players add @s points 45
execute if score @s blazes matches 1.. run scoreboard players add @s points 2

# Register that the mob has been killed
execute unless score $anyone blazes matches 1 run scoreboard players set $anyone blazes 1

