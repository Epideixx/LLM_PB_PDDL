(define (problem transport_balls)
  (:domain gripper-strips)
  (:objects 
    robot1 robot2 - robot
    left_gripper_robot1 right_gripper_robot1 left_gripper_robot2 right_gripper_robot2 - gripper
    room1 room2 - room
    ball1 ball2 ball3 ball4 ball5 - object
  )

  (:init 
    ;; Robot locations
    (at-robby robot1 room2)
    (at-robby robot2 room1)
    
    ;; Ball locations
    (at ball1 room1)
    (at ball2 room1)
    (at ball3 room1)
    (at ball4 room1)
    (at ball5 room1)
    
    ;; Gripper status
    (free robot1 left_gripper_robot1)
    (free robot1 right_gripper_robot1)
    (free robot2 left_gripper_robot2)
    (free robot2 right_gripper_robot2)
  )

  (:goal 
    (and 
      ;; Goal ball locations
      (at ball1 room1)
      (at ball2 room1)
      (at ball3 room2)
      (at ball4 room1)
      (at ball5 room1)
    )
  )
)
