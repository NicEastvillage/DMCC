team leave @a
team join players @a[gamemode=adventure]

# Remove spawn cage
execute at @e[tag=spawn] run fill ~-4 ~0 ~-4 ~4 ~4 ~4 minecraft:air
gamemode survival @a[team=players]