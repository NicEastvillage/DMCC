
execute if score #running vars = #one vars run effect give @a[gamemode=adventure,scores={deaths=0}] minecraft:resistance 1 1 true

execute at @e[tag=Chest] unless block ~ ~ ~ minecraft:chest{Items:[]} run particle minecraft:soul_fire_flame ~ ~0.8 ~ 0.2 0.4 0.2 0.01 1
execute at @e[tag=Chest] if block ~ ~ ~ minecraft:chest{Items:[]} unless entity @p[gamemode=adventure,scores={deaths=0},distance=..7] run setblock ~ ~ ~ air
execute as @e[tag=Chest] at @s if block ~ ~ ~ air run kill @s
gamemode spectator @a[gamemode=!creative,scores={deaths=1..}]

scoreboard players set #playerCount vars 0
execute as @a[gamemode=adventure,scores={deaths=0}] run scoreboard players add #playerCount vars 1
execute if score #running vars = #one vars if score #playerCount vars = #one vars run function hungergames:end
execute if score #running vars = #one vars if score #playerCount vars > #one vars run scoreboard players add @a[gamemode=adventure,scores={deaths=0}] ticksAlive 1
