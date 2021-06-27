from mobhunt.generate import mobs, POINTS_MINI_BOSS, POINTS_BOSS, POINTS_EPIC, POINTS_RARE, POINTS_COMMON

for p in [POINTS_COMMON, POINTS_RARE, POINTS_EPIC, POINTS_MINI_BOSS, POINTS_BOSS]:
    group = [mob.replace("_", " ") for mob, points in mobs if points == p]
    print(f"{p} points:\n{', '.join(group)}\n")
