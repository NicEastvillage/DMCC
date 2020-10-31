title @a times 0 20 0
execute unless entity @a[scores={ready=0}] run schedule function countdown:three 1s
execute unless entity @a[scores={ready=0}] run schedule function countdown:two 2s
execute unless entity @a[scores={ready=0}] run schedule function countdown:one 3s
execute unless entity @a[scores={ready=0}] run schedule function countdown:go 4s
execute unless entity @a[scores={ready=0}] run schedule function game:start 4s
execute if entity @a[scores={ready=0}] run scoreboard objectives remove ready
