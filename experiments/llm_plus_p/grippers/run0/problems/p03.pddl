(define (problem gripper_problem)
  (:domain gripper-strips)
  (:objects robot1 robot2 - robot
            ball1 ball2 - object
            room1 room2 room3 room4 room5 - room
            left right - gripper)
  (:init (at-robby robot1 room1)
         (at-robby robot2 room2)
         (at ball1 room1)
         (at ball2 room1)
         (free robot1 left)
         (free robot1 right)
         (free robot2 left)
         (free robot2 right))
  (:goal (and (at ball1 room5)
              (at ball2 room4)))
)