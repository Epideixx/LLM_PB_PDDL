(define (problem gripper_problem)
  (:domain gripper-strips)
  (:objects robot1 - robot
            room1 room2 - room
            ball1 ball2 ball3 - object
            left right - gripper)
  (:init (at-robby robot1 room1)
         (at ball1 room1)
         (at ball2 room1)
         (at ball3 room1)
         (free robot1 left)
         (free robot1 right))
  (:goal (and (at ball1 room1)
              (at ball2 room1)
              (at ball3 room2)))
)