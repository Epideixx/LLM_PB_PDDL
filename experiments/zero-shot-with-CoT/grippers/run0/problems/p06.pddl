(define (problem gripper-problem)
  (:domain gripper-strips)
  (:objects
    robot1 robot2 - robot
    left-gripper1 right-gripper1 left-gripper2 right-gripper2 - gripper
    room1 room2 room3 - room
    ball1 - object)
  (:init
    (at-robby robot1 room3)
    (at-robby robot2 room2)
    (at ball1 room1)
    (free robot1 left-gripper1)
    (free robot1 right-gripper1)
    (free robot2 left-gripper2)
    (free robot2 right-gripper2))
  (:goal
    (at ball1 room3)))