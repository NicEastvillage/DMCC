default_rules = {
    "announceAdvancements": "true",
    "commandBlockOutput": "true",
    "disableElytraMovementCheck": "false",
    "disableRaids": "false",
    "doDaylightCycle": "true",
    "doEntityDrops": "true",
    "doFireTick": "true",
    "doImmediateRespawn": "false",
    "doInsomnia": "true",
    "doLimitedCrafting": "false",
    "doMobLoot": "true",
    "doMobSpawning": "true",
    "doPatrolSpawning": "true",
    "doTileDrops": "true",
    "doTraderSpawning": "true",
    "doWeatherCycle": "true",
    "drowningDamage": "true",
    "fallDamage": "true",
    "fireDamage": "true",
    "forgiveDeadPlayers": "true",
    "keepInventory": "false",
    "logAdminCommands": "true",
    "maxCommandChainLength": "65536",
    "maxEntityCramming": "24",
    "mobGriefing": "true",
    "naturalRegeneration": "true",
    "randomTickSpeed": "3",
    "reducedDebugInfo": "false",
    "sendCommandFeedback": "true",
    "showDeathMessages": "true",
    "spawnRadius": "10",
    "spectatorsGenerateChunks": "true",
    "universalAnger": "false",
}

with open("rules.cfg", "r") as config:
    lines = [line.split("=") for line in config.readlines()]
    rules = {line[0].strip() : line[1].strip() for line in lines}

for rule, default in default_rules.items():
    value = rules.get(rule, default)
    print(f"gamerule {rule} {value}")
    