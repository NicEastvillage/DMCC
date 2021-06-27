
fill ~2 ~ ~2 ~-2 ~ ~-2 air
summon minecraft:armor_stand ~1 ~ ~ {Marker:1b,Invisible:1b,Tags:["Chest"]}
summon minecraft:armor_stand ~-1 ~ ~ {Marker:1b,Invisible:1b,Tags:["Chest"]}
summon minecraft:armor_stand ~ ~ ~1 {Marker:1b,Invisible:1b,Tags:["Chest"]}
summon minecraft:armor_stand ~ ~ ~-1 {Marker:1b,Invisible:1b,Tags:["Chest"]}
summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["Beacon"]}
setblock ~ ~ ~-1 minecraft:chest[facing=north]{LootTable:"hungergames:chests/wild_chest"}
setblock ~1 ~ ~ minecraft:chest[facing=east]{LootTable:"hungergames:chests/wild_chest"}
setblock ~ ~ ~1 minecraft:chest[facing=south]{LootTable:"hungergames:chests/wild_chest"}
setblock ~-1 ~ ~ minecraft:chest[facing=west]{LootTable:"hungergames:chests/wild_chest"}
setblock ~2 ~-1 ~ minecraft:crafting_table
setblock ~-2 ~-1 ~ minecraft:crafting_table
setblock ~ ~-1 ~2 minecraft:furnace
setblock ~ ~-1 ~-2 minecraft:furnace

fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:iron_block
setblock ~ ~ ~ minecraft:beacon

setblock ~ ~-2 ~ minecraft:repeating_command_block{auto:1b,powered:0b,Command:"function hungergames:tick"}
