Based on the provided text and the domain constraints, here is the complete PDDL problem definition:

```lisp
(define (problem gripper-pb)
   (:domain gripper-strips)

   (:objects
      robot1 robot2 robot3 robot4 - robot
      left_gripper1 right_gripper1 left_gripper2 right_gripper2 left_gripper3 right_gripper3 left_gripper4 right_gripper4 - gripper
      room1 room2 room3 room4 - room
      ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 - object
   )

   (:init
      ;; Robot initial locations
      (at-robby robot1 room1)
      (at-robby robot2 room4)
      (at-robby robot3 room3)
      (at-robby robot4 room4)

      ;; Ball initial locations
      (at ball1 room3)
      (at ball2 room3)
      (at ball3 room3)
      (at ball4 room1)
      (at ball5 room4)
      (at ball6 room4)
      (at ball7 room1)
      (at ball8 room1)

      ;; Gripper initial states (all free)
      (free robot1 left_gripper1)
      (free robot1 right_gripper1)
      (free robot2 left_gripper2)
      (free robot2 right_gripper2)
      (free robot3 left_gripper3)
      (free robot3 right_gripper3)
      (free robot4 left_gripper4)
      (free robot4 right_gripper4)
   )

   (:goal
      (and
         ;; Ball target locations
         (at ball1 room2)
         (at ball2 room3)
         (at ball3 room1)
         (at ball4 room3)
         (at ball5 room1)
         (at ball6 room1)
         (at ball7 room4)
         (at ball8 room2)
      )
   )
)
```

### Explanation:

- **Objects**: Lists all objects including robots, grippers, rooms, and balls. Each type of object is followed by its corresponding type in the domain.
  
- **:init Section**:
  - **Robot Initial Locations**: Specifies the initial room for each robot.
  - **Ball Initial Locations**: Specifies the initial room for each ball.
  - **Gripper Initial States**: Specifies that all grippers for each robot are initially free.

- **:goal Section**:
  - Specifies the target room for each ball, indicating where each ball should be moved to achieve the goal state.

This PDDL problem definition captures the initial state and goal state as described in the text and ensures that all necessary information is included for solving the problem within the given domain.