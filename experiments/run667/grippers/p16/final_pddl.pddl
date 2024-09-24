(define (problem gripper-problem)
  (:domain gripper-strips)
  
  ;; Define the objects in the problem
  (:objects 
    robot1 robot2 robot3 robot4 - robot
    robot1_left_gripper robot1_right_gripper
    robot2_left_gripper robot2_right_gripper
    robot3_left_gripper robot3_right_gripper
    robot4_left_gripper robot4_right_gripper - gripper
    room1 room2 room3 room4 - room
    ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 - object)
  
  ;; Define the initial state
  (:init 
    ;; Initial positions of robots
    (at-robby robot1 room1)
    (at-robby robot2 room4)
    (at-robby robot3 room3)
    (at-robby robot4 room4)
    
    ;; Initial positions of balls
    (at ball1 room3)
    (at ball2 room3)
    (at ball3 room3)
    (at ball4 room1)
    (at ball5 room4)
    (at ball6 room4)
    (at ball7 room1)
    (at ball8 room1)
    
    ;; Initial state of grippers (all free)
    (free robot1 robot1_left_gripper)
    (free robot1 robot1_right_gripper)
    (free robot2 robot2_left_gripper)
    (free robot2 robot2_right_gripper)
    (free robot3 robot3_left_gripper)
    (free robot3 robot3_right_gripper)
    (free robot4 robot4_left_gripper)
    (free robot4 robot4_right_gripper))
  
  ;; Define the goal state
  (:goal (and 
    (at ball1 room2)
    (at ball2 room3)
    (at ball3 room1)
    (at ball4 room3)
    (at ball5 room1)
    (at ball6 room1)
    (at ball7 room4)
    (at ball8 room2))))