SIZE_ROOM = [5, 5]
POSITION_MONKEY = [0, 0]
POSITION_BANANA = [3, 1]
POSITION_CHAIR = [4, 4]
ALTITUDE_BANANA = "very-high"
ID_PB = 1

pddl_pb = f"(define (problem monkey_banana_{ID_PB})\n"

pddl_pb += f"(:domain monkey-banana)\n"

pddl_pb += f"(:objects\n"
pddl_pb += f"    monkey - monkey\n"
pddl_pb += f"    banana - banana\n"
pddl_pb += f"    chair - chair\n"
for i in range(SIZE_ROOM[0]):
    for j in range(SIZE_ROOM[1]):
        pddl_pb += f"    position_{i}_{j} - position\n"
pddl_pb += f")\n"

pddl_pb += f"(:init\n"
pddl_pb += f"    (on-ground monkey)\n"
pddl_pb += f"    (at monkey position_{POSITION_MONKEY[0]}_{POSITION_MONKEY[1]})\n"
pddl_pb += f"    (at banana position_{POSITION_BANANA[0]}_{POSITION_BANANA[1]})\n"
pddl_pb += f"    (at chair position_{POSITION_CHAIR[0]}_{POSITION_CHAIR[1]})\n"
if ALTITUDE_BANANA == "low":
    pddl_pb += f"    (on-ground banana)\n"
elif ALTITUDE_BANANA == "high":
    pddl_pb += f"    (high banana)\n"
else:
    pddl_pb += f"    (very-high banana)\n"
for i in range(SIZE_ROOM[0]):
    for j in range(SIZE_ROOM[1]):
        if i-1 >= 0:
            pddl_pb += f"    (adjacent position_{i}_{j} position_{i-1}_{j})\n"
        if j-1 >= 0:
            pddl_pb += f"    (adjacent position_{i}_{j} position_{i}_{j-1})\n"
        if i+1 < SIZE_ROOM[0]:
            pddl_pb += f"    (adjacent position_{i}_{j} position_{i+1}_{j})\n"
        if j+1 < SIZE_ROOM[1]:
            pddl_pb += f"    (adjacent position_{i}_{j} position_{i}_{j+1})\n"
pddl_pb += f"    (pushable chair)\n"
pddl_pb += f"    (climbable chair)\n"
pddl_pb += f"    (graspable banana)\n"
pddl_pb += f"    (can-jump monkey)\n"
pddl_pb += f"    (hand-free monkey)\n"
pddl_pb += f")\n"

pddl_pb += f"(:goal (and\n"
pddl_pb += f"    (hold monkey banana)\n"
pddl_pb += f"))\n"

pddl_pb += "\n)"

with open(f"p{ID_PB}.pddl", "w") as file:
    file.write(pddl_pb)

