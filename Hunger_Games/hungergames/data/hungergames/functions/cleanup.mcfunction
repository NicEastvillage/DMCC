function hungergames:remove_chests

execute at @e[tag=Beacon] run fill ~2 ~-1 ~2 ~-2 ~-2 ~-2 dirt
execute at @e[tag=Beacon] run setblock ~ ~ ~ air
execute at @e[tag=Beacon] run fill ~-1 ~43 ~-1 ~1 ~46 ~1 air

kill @e[tag=Beacon]