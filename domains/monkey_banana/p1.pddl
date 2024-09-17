(define (problem monkey_banana_1)
(:domain monkey-banana)
(:objects
    monkey - monkey
    banana - banana
    chair - chair
    position_0_0 - position
    position_0_1 - position
    position_0_2 - position
    position_0_3 - position
    position_0_4 - position
    position_1_0 - position
    position_1_1 - position
    position_1_2 - position
    position_1_3 - position
    position_1_4 - position
    position_2_0 - position
    position_2_1 - position
    position_2_2 - position
    position_2_3 - position
    position_2_4 - position
    position_3_0 - position
    position_3_1 - position
    position_3_2 - position
    position_3_3 - position
    position_3_4 - position
    position_4_0 - position
    position_4_1 - position
    position_4_2 - position
    position_4_3 - position
    position_4_4 - position
)
(:init
    (on-ground monkey)
    (at monkey position_0_0)
    (at banana position_3_1)
    (at chair position_4_4)
    (very-high banana)
    (adjacent position_0_0 position_1_0)
    (adjacent position_0_0 position_0_1)
    (adjacent position_0_1 position_0_0)
    (adjacent position_0_1 position_1_1)
    (adjacent position_0_1 position_0_2)
    (adjacent position_0_2 position_0_1)
    (adjacent position_0_2 position_1_2)
    (adjacent position_0_2 position_0_3)
    (adjacent position_0_3 position_0_2)
    (adjacent position_0_3 position_1_3)
    (adjacent position_0_3 position_0_4)
    (adjacent position_0_4 position_0_3)
    (adjacent position_0_4 position_1_4)
    (adjacent position_1_0 position_0_0)
    (adjacent position_1_0 position_2_0)
    (adjacent position_1_0 position_1_1)
    (adjacent position_1_1 position_0_1)
    (adjacent position_1_1 position_1_0)
    (adjacent position_1_1 position_2_1)
    (adjacent position_1_1 position_1_2)
    (adjacent position_1_2 position_0_2)
    (adjacent position_1_2 position_1_1)
    (adjacent position_1_2 position_2_2)
    (adjacent position_1_2 position_1_3)
    (adjacent position_1_3 position_0_3)
    (adjacent position_1_3 position_1_2)
    (adjacent position_1_3 position_2_3)
    (adjacent position_1_3 position_1_4)
    (adjacent position_1_4 position_0_4)
    (adjacent position_1_4 position_1_3)
    (adjacent position_1_4 position_2_4)
    (adjacent position_2_0 position_1_0)
    (adjacent position_2_0 position_3_0)
    (adjacent position_2_0 position_2_1)
    (adjacent position_2_1 position_1_1)
    (adjacent position_2_1 position_2_0)
    (adjacent position_2_1 position_3_1)
    (adjacent position_2_1 position_2_2)
    (adjacent position_2_2 position_1_2)
    (adjacent position_2_2 position_2_1)
    (adjacent position_2_2 position_3_2)
    (adjacent position_2_2 position_2_3)
    (adjacent position_2_3 position_1_3)
    (adjacent position_2_3 position_2_2)
    (adjacent position_2_3 position_3_3)
    (adjacent position_2_3 position_2_4)
    (adjacent position_2_4 position_1_4)
    (adjacent position_2_4 position_2_3)
    (adjacent position_2_4 position_3_4)
    (adjacent position_3_0 position_2_0)
    (adjacent position_3_0 position_4_0)
    (adjacent position_3_0 position_3_1)
    (adjacent position_3_1 position_2_1)
    (adjacent position_3_1 position_3_0)
    (adjacent position_3_1 position_4_1)
    (adjacent position_3_1 position_3_2)
    (adjacent position_3_2 position_2_2)
    (adjacent position_3_2 position_3_1)
    (adjacent position_3_2 position_4_2)
    (adjacent position_3_2 position_3_3)
    (adjacent position_3_3 position_2_3)
    (adjacent position_3_3 position_3_2)
    (adjacent position_3_3 position_4_3)
    (adjacent position_3_3 position_3_4)
    (adjacent position_3_4 position_2_4)
    (adjacent position_3_4 position_3_3)
    (adjacent position_3_4 position_4_4)
    (adjacent position_4_0 position_3_0)
    (adjacent position_4_0 position_4_1)
    (adjacent position_4_1 position_3_1)
    (adjacent position_4_1 position_4_0)
    (adjacent position_4_1 position_4_2)
    (adjacent position_4_2 position_3_2)
    (adjacent position_4_2 position_4_1)
    (adjacent position_4_2 position_4_3)
    (adjacent position_4_3 position_3_3)
    (adjacent position_4_3 position_4_2)
    (adjacent position_4_3 position_4_4)
    (adjacent position_4_4 position_3_4)
    (adjacent position_4_4 position_4_3)
    (pushable chair)
    (climbable chair)
    (graspable banana)
    (can-jump monkey)
    (hand-free monkey)
)
(:goal (and
    (hold monkey banana)
))

)