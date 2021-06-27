
### THIS FILE IS GENERATED

advancement revoke @s only mobhunt:kill/elder_guardian

# Announce killing
execute unless score $anyone elder_guardians matches 1 run tellraw @a [{"selector":"@s","color":"green"},{"text":" was first to kill a ","color":"gold"},{"text":"elder guardian","color":"gold"},{"text":" (+400, +15)","color":"green"}]
execute if score $anyone elder_guardians matches 1 unless score @s elder_guardians matches 1.. run tellraw @a [{"selector":"@s","color":"green"},{"text":" killed a ","color":"yellow"},{"text":"elder guardian","color":"gold"},{"text":" (+400)","color":"green"}]

# Add points
execute unless score $anyone elder_guardians matches 1.. run scoreboard players add @s points 15
execute unless score @s elder_guardians matches 1.. run scoreboard players add @s points 400
execute if score @s elder_guardians matches 1.. run scoreboard players add @s points 2

# Register that the mob has been killed
execute unless score $anyone elder_guardians matches 1 run scoreboard players set $anyone elder_guardians 1

