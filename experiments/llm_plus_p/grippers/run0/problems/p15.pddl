(define (problem gripper_problem)
  (:domain gripper-strips)
  (:objects robot1 - robot
            room1 room2 room3 room4 room5 - room
            ball1 ball2 ball3 - object
            left right - gripper)
  (:init (at-robby robot1 room4)
         (at ball1 room3)
         (at ball2 room5)
         (at ball3 room3)
         (free robot1 left)
         (free robot1 right))
  (:goal (and (at ball1 room5)
              (at ball2 room2)
              (at ball3 room1))))