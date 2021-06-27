from pathlib import Path

POINTS_REKILL = 2
POINTS_FIRST = 15
POINTS_COMMON = 30
POINTS_RARE = 45
POINTS_EPIC = 100
POINTS_MINI_BOSS = 400
POINTS_BOSS = 2000

mobs = [
    ("bat", POINTS_COMMON),
    ("bee", POINTS_COMMON),
    ("blaze", POINTS_RARE),
    ("cat", POINTS_COMMON),
    ("cave_spider", POINTS_RARE),
    ("chicken", POINTS_COMMON),
    ("cod", POINTS_COMMON),
    ("cow", POINTS_COMMON),
    ("creeper", POINTS_COMMON),
    ("dolphin", POINTS_COMMON),
    ("donkey", POINTS_COMMON),
    ("drowned", POINTS_COMMON),
    ("elder_guardian", POINTS_MINI_BOSS),
    ("ender_dragon", POINTS_BOSS),
    ("enderman", POINTS_COMMON),
    ("endermite", POINTS_EPIC),
    ("evoker", POINTS_EPIC),
    ("fox", POINTS_RARE),
    ("ghast", POINTS_RARE),
    ("guardian", POINTS_COMMON),
    ("hoglin", POINTS_RARE),
    ("horse", POINTS_COMMON),
    ("husk", POINTS_COMMON),
    ("iron_golem", POINTS_COMMON),
    ("llama", POINTS_COMMON),
    ("magma_cube", POINTS_RARE),
    ("mooshroom", POINTS_EPIC),
    ("mule", POINTS_EPIC),
    ("ocelot", POINTS_COMMON),
    ("panda", POINTS_RARE),
    ("parrot", POINTS_RARE),
    ("phantom", POINTS_EPIC),
    ("pig", POINTS_COMMON),
    ("piglin", POINTS_RARE),
    ("piglin_brute", POINTS_RARE),
    ("pillager", POINTS_RARE),
    ("polar_bear", POINTS_RARE),
    ("pufferfish", POINTS_COMMON),
    ("rabbit", POINTS_COMMON),
    ("ravager", POINTS_EPIC),
    ("salmon", POINTS_COMMON),
    ("sheep", POINTS_COMMON),
    ("shulker", POINTS_EPIC),
    ("silverfish", POINTS_RARE),
    ("skeleton", POINTS_COMMON),
    ("skeleton_horse", POINTS_EPIC),
    ("slime", POINTS_COMMON),
    ("snow_golem", POINTS_COMMON),
    ("spider", POINTS_COMMON),
    ("squid", POINTS_COMMON),
    ("stray", POINTS_COMMON),
    ("strider", POINTS_RARE),
    ("trader_llama", POINTS_EPIC),
    ("tropical_fish", POINTS_COMMON),
    ("turtle", POINTS_COMMON),
    ("vex", POINTS_EPIC),
    ("villager", POINTS_COMMON),
    ("vindicator", POINTS_EPIC),
    ("wandering_trader", POINTS_EPIC),
    ("witch", POINTS_RARE),
    ("wither", POINTS_BOSS),
    ("wither_skeleton", POINTS_RARE),
    ("wolf", POINTS_COMMON),
    ("zoglin", POINTS_RARE),
    ("zombie", POINTS_COMMON),
    ("zombie_horse", POINTS_EPIC),
    ("zombie_villager", POINTS_RARE),
    ("zombified_piglin", POINTS_RARE),
]

on_kill_path = Path("functions/on_kill")
on_kill_path.mkdir(exist_ok=True)

advancements_path = Path("advancements/kill")
advancements_path.mkdir(exist_ok=True)

for mob, points in mobs:
    obj_name = mob.replace("zombified", "zomb").replace("wandering", "wand")
    with open(advancements_path / f"{mob}.json", "w") as file:
        file.write(f"""{{
    "__comment": "Triggered when killing {mob}s",
    "criteria": {{
        "kill": {{
            "trigger": "minecraft:player_killed_entity",
            "conditions": {{
                "entity": {{
                    "type": "minecraft:{mob}"
                }}
            }}
        }}
    }},
    "rewards": {{
        "function": "mobhunt:on_kill/{mob}"
    }}
}}""")

    with open(on_kill_path / f"{mob}.mcfunction", "w") as file:

        rarity_color = {
            POINTS_COMMON: "aqua",
            POINTS_RARE: "blue",
            POINTS_EPIC: "light_purple",
            POINTS_MINI_BOSS: "gold",
            POINTS_BOSS: "red",
        }[points]

        file.write(f"""
### THIS FILE IS GENERATED

advancement revoke @s only mobhunt:kill/{mob}

# Announce killing
execute unless score $anyone {obj_name}s matches 1 run tellraw @a [{{"selector":"@s","color":"green"}},{{"text":" was first to kill a ","color":"gold"}},{{"text":"{mob.replace('_', ' ')}","color":"{rarity_color}"}},{{"text":" (+{points}, +{POINTS_FIRST})","color":"green"}}]
execute if score $anyone {obj_name}s matches 1 unless score @s {obj_name}s matches 1.. run tellraw @a [{{"selector":"@s","color":"green"}},{{"text":" killed a ","color":"yellow"}},{{"text":"{mob.replace('_', ' ')}","color":"{rarity_color}"}},{{"text":" (+{points})","color":"green"}}]

# Add points
execute unless score $anyone {obj_name}s matches 1.. run scoreboard players add @s points {POINTS_FIRST}
execute unless score @s {obj_name}s matches 1.. run scoreboard players add @s points {points}
execute if score @s {obj_name}s matches 1.. run scoreboard players add @s points {POINTS_REKILL}

# Register that the mob has been killed
execute unless score $anyone {obj_name}s matches 1 run scoreboard players set $anyone {obj_name}s 1

""")

with open("functions/setup_mob_scores.mcfunction", "w") as file:
    file.write("### THIS FILE IS GENERATED\n")
    for mob, points in mobs:
        obj_name = mob.replace("zombified", "zomb").replace("wandering", "wand")
        file.write(f"""
scoreboard objectives add {obj_name}s minecraft.killed:minecraft.{mob}
scoreboard players reset * {obj_name}s
""")
