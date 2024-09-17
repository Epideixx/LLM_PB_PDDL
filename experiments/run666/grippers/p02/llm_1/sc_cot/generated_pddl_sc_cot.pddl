(define (problem gripper-problem)
   (:domain gripper-strips)
   (:objects 
      robot1 robot2  ;; robots
      room1 room2 room3  ;; rooms
      ball1 ball2 ball3 ball4  ;; balls
      robot1-left-gripper robot1-right-gripper robot2-left-gripper robot2-right-gripper  ;; grippers
   )
   (:init 
      (robot robot1) 
      (robot robot2)
      (room room1) 
      (room room2) 
      (room room3)
      (object ball1) 
      (object ball2) 
      (object ball3) 
      (object ball4)
      (gripper robot1-left-gripper) 
      (gripper robot1-right-gripper) 
      (gripper robot2-left-gripper) 
      (gripper robot2-right-gripper)
      (at-robby robot2 room3)
      (at-robby robot1 room2)
      (at ball1 room3)
      (at ball2 room1)
      (at ball3 room1)
      (at ball4 room3)
      (free robot1 robot1-left-gripper)
      (free robot1 robot1-right-gripper)
      (free robot2 robot2-left-gripper)
      (free robot2 robot2-right-gripper)
   )
   (:goal 
      (and 
         (at ball1 room2)
         (at ball2 room2)
         (at ball3 room3)
         (at ball4 room3)
      )
   )
)
