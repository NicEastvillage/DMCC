
### THIS FILE IS GENERATED

advancement revoke @s only mobhunt:kill/squid

# Announce killing
execute unless score $anyone squids matches 1 run tellraw @a [{"selector":"@s","color":"green"},{"text":" was first to kill a ","color":"gold"},{"text":"squid","color":"aqua"},{"text":" (+30, +15)","color":"green"}]
execute if score $anyone squids matches 1 unless score @s squids matches 1.. run tellraw @a [{"selector":"@s","color":"green"},{"text":" killed a ","color":"yellow"},{"text":"squid","color":"aqua"},{"text":" (+30)","color":"green"}]

# Add points
execute unless score $anyone squids matches 1.. run scoreboard players add @s points 15
execute unless score @s squids matches 1.. run scoreboard players add @s points 30
execute if score @s squids matches 1.. run scoreboard players add @s points 2

# Register that the mob has been killed
execute unless score $anyone squids matches 1 run scoreboard players set $anyone squids 1

