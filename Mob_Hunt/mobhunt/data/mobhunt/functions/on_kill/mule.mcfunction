
### THIS FILE IS GENERATED

advancement revoke @s only mobhunt:kill/mule

# Announce killing
execute unless score $anyone mules matches 1 run tellraw @a [{"selector":"@s","color":"green"},{"text":" was first to kill a ","color":"gold"},{"text":"mule","color":"light_purple"},{"text":" (+100, +15)","color":"green"}]
execute if score $anyone mules matches 1 unless score @s mules matches 1.. run tellraw @a [{"selector":"@s","color":"green"},{"text":" killed a ","color":"yellow"},{"text":"mule","color":"light_purple"},{"text":" (+100)","color":"green"}]

# Add points
execute unless score $anyone mules matches 1.. run scoreboard players add @s points 15
execute unless score @s mules matches 1.. run scoreboard players add @s points 100
execute if score @s mules matches 1.. run scoreboard players add @s points 2

# Register that the mob has been killed
execute unless score $anyone mules matches 1 run scoreboard players set $anyone mules 1

