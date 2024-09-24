(define (problem ball_transport)
   (:domain gripper-strips)
   (:objects robot1 robot2  ;; robots
             left_gripper1 right_gripper1 left_gripper2 right_gripper2  ;; grippers
             room1 room2  ;; rooms
             ball1 ball2 ball3 ball4 ball5)  ;; balls (objects)
   
   (:init 
      ;; Define object types
      (robot robot1) (robot robot2)
      (gripper left_gripper1) (gripper right_gripper1) 
      (gripper left_gripper2) (gripper right_gripper2)
      (room room1) (room room2)
      (object ball1) (object ball2) (object ball3) (object ball4) (object ball5)
      
      ;; Initial locations of robots
      (at-robby robot2 room1)
      (at-robby robot1 room2)

      ;; Initial locations of balls
      (at ball1 room1)
      (at ball2 room1)
      (at ball3 room1)
      (at ball4 room1)
      (at ball5 room1)
      
      ;; Initial status of grippers
      (free robot1 left_gripper1)
      (free robot1 right_gripper1)
      (free robot2 left_gripper2)
      (free robot2 right_gripper2)
   )

   (:goal (and 
      ;; Goal locations of balls
      (at ball1 room1)
      (at ball2 room1)
      (at ball3 room2)
      (at ball4 room1)
      (at ball5 room1)
   ))
)
