
### THIS FILE IS GENERATED

advancement revoke @s only mobhunt:kill/hoglin

# Announce killing
execute unless score $anyone hoglins matches 1 run tellraw @a [{"selector":"@s","color":"green"},{"text":" was first to kill a ","color":"gold"},{"text":"hoglin","color":"blue"},{"text":" (+45, +15)","color":"green"}]
execute if score $anyone hoglins matches 1 unless score @s hoglins matches 1.. run tellraw @a [{"selector":"@s","color":"green"},{"text":" killed a ","color":"yellow"},{"text":"hoglin","color":"blue"},{"text":" (+45)","color":"green"}]

# Add points
execute unless score $anyone hoglins matches 1.. run scoreboard players add @s points 15
execute unless score @s hoglins matches 1.. run scoreboard players add @s points 45
execute if score @s hoglins matches 1.. run scoreboard players add @s points 2

# Register that the mob has been killed
execute unless score $anyone hoglins matches 1 run scoreboard players set $anyone hoglins 1

