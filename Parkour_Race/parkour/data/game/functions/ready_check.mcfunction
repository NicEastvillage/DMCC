scoreboard objectives remove ready
scoreboard objectives add ready dummy
scoreboard objectives setdisplay sidebar ready
scoreboard players set @a[gamemode=!spectator] ready 0

# TODO use trigger instead
tellraw @a [{"text":"Are you ready? "},{"text":"YES","bold":true,"color":"dark_green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s ready 1"}},{"text":" "},{"text":"NO","bold":true,"color":"dark_red","clickEvent":{"action":"run_command","value":"/scoreboard players set @s ready 0"}}]

schedule function game:countdown 5s
