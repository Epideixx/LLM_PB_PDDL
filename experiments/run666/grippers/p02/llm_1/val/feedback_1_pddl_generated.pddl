(define (problem gripper-problem)
   (:domain gripper-strips)
   (:objects 
      robot1 robot2 - robot  ;; robots
      room1 room2 room3 - room  ;; rooms
      ball1 ball2 ball3 ball4 - object  ;; balls (objects)
      robot1-left-gripper robot1-right-gripper robot2-left-gripper robot2-right-gripper - gripper  ;; grippers
   )
   (:init 
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
