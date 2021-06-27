
### THIS FILE IS GENERATED

advancement revoke @s only mobhunt:kill/wither

# Announce killing
execute unless score $anyone withers matches 1 run tellraw @a [{"selector":"@s","color":"green"},{"text":" was first to kill a ","color":"gold"},{"text":"wither","color":"red"},{"text":" (+2000, +15)","color":"green"}]
execute if score $anyone withers matches 1 unless score @s withers matches 1.. run tellraw @a [{"selector":"@s","color":"green"},{"text":" killed a ","color":"yellow"},{"text":"wither","color":"red"},{"text":" (+2000)","color":"green"}]

# Add points
execute unless score $anyone withers matches 1.. run scoreboard players add @s points 15
execute unless score @s withers matches 1.. run scoreboard players add @s points 2000
execute if score @s withers matches 1.. run scoreboard players add @s points 2

# Register that the mob has been killed
execute unless score $anyone withers matches 1 run scoreboard players set $anyone withers 1

