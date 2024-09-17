(define (problem gripper_problem)
  (:domain gripper-strips)
  (:objects robot1 robot2 - robot
            room1 room2 room3 - room
            ball1 - object
            left right - gripper)
  (:init (at-robby robot1 room3)
         (at-robby robot2 room2)
         (at ball1 room1)
         (free robot1 left)
         (free robot1 right)
         (free robot2 left)
         (free robot2 right))
  (:goal (at ball1 room3))
)