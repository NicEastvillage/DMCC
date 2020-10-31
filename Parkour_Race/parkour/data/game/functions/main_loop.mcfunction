# run timer
function timer:run

effect give @a minecraft:saturation 3 3 true
effect give @a minecraft:resistance 3 100 true
effect give @a[team=players] minecraft:invisibility 3 0 true

# boots
# clear @a minecraft:leather_boots
# replaceitem entity @a armor.feet minecraft:leather_boots

# right click with warped fungus on a stick
execute as @a[scores={used_warped=1..}] run function game:return_to_last_checkpoint
scoreboard players set @a used_warped 0

# auto-return when falling
execute positioned -1000 80 -1000 as @a[dx=2000,dz=2000,dy=10,team=players] run function game:return_to_last_checkpoint
