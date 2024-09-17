(define (problem gripper_problem)
  (:domain gripper-strips)
  (:objects robot1 robot2 robot3 - robot
            ball1 ball2 ball3 ball4 - object
            room1 room2 room3 room4 - room
            left right - gripper)
  (:init (at-robby robot1 room4)
         (at-robby robot2 room4)
         (at-robby robot3 room1)
         (at ball1 room1)
         (at ball2 room1)
         (at ball3 room1)
         (at ball4 room2)
         (free robot1 left)
         (free robot1 right)
         (free robot2 left)
         (free robot2 right)
         (free robot3 left)
         (free robot3 right))
  (:goal (and (at ball1 room1)
              (at ball2 room1)
              (at ball3 room3)
              (at ball4 room2))))