Sure! Here is the PDDL representation of the given problem.

```pddl
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
```

### Explanation:

1. **Objects**:
   - **robots**: robot1, robot2
   - **rooms**: room1, room2, room3
   - **balls**: ball1, ball2, ball3, ball4
   - **grippers**: robot1-left-gripper, robot1-right-gripper, robot2-left-gripper, robot2-right-gripper

2. **Initial State**:
   - Define the objects and their types (robots, rooms, balls, grippers).
   - Set the initial locations of the robots and balls:
     - robot2 is in room3.
     - robot1 is in room2.
     - ball1 is in room3.
     - ball2 is in room1.
     - ball3 is in room1.
     - ball4 is in room3.
   - Indicate that all robot grippers are free.

3. **Goal State**:
   - Specify the desired final locations of the balls:
     - ball1 should be in room2.
     - ball2 should be in room2.
     - ball3 should be in room3.
     - ball4 should be in room3.

This PDDL problem definition should be consistent with the given domain and problem description.