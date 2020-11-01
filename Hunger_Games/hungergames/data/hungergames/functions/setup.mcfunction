gamerule commandBlockOutput false
gamerule doImmediateRespawn true
gamerule doDaylightCycle false
gamerule announceAdvancements false

function hungergames:cleanup

function hungergames:spawn_chests
execute align xyz positioned ~0.5 ~0 ~0.5 run function hungergames:create_start_area

execute align xyz positioned ~0.5 ~0 ~0.5 run fill ~-1 ~43 ~-1 ~1 ~46 ~1 glass hollow
execute align xyz positioned ~0.5 ~0 ~0.5 run tp @a ~0 ~44 ~0
execute align xyz positioned ~0.5 ~0 ~0.5 run setworldspawn ~ ~44 ~
execute align xyz positioned ~0.5 ~0 ~0.5 run spawnpoint @a ~ ~ ~
gamemode adventure @a
defaultgamemode adventure
difficulty peaceful
clear @a
team add players "Players"
team modify players friendlyFire false
team join players @a

execute align xyz positioned ~0.5 ~0 ~0.5 run worldborder center ~ ~
worldborder damage buffer 2
worldborder damage amount 0.1
worldborder set 420 0

scoreboard objectives add deaths deathCount "Deaths"
scoreboard players set @a deaths 0
scoreboard objectives add kills playerKillCount "Kills"
scoreboard objectives setdisplay sidebar kills
scoreboard players set @a kills 0
scoreboard objectives add ticksAlive dummy "Ticks Spent Alive"
scoreboard players set @a ticksAlive 0

scoreboard objectives add vars dummy
scoreboard players set #running vars 0
scoreboard players set #playerCount vars 0
scoreboard players set #one vars 1
