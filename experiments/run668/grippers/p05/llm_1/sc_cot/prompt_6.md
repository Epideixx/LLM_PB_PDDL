Given the information provided and following the rules and structure of PDDL, here is the complete problem definition:

```lisp
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
```

### Explanation:
- **Objects**:
  - **Robots**: `robot1`, `robot2`
  - **Grippers**: `left_gripper_robot1`, `right_gripper_robot1`, `left_gripper_robot2`, `right_gripper_robot2`
  - **Rooms**: `room1`, `room2`
  - **Balls**: `ball1`, `ball2`, `ball3`, `ball4`, `ball5`

- **Initial State**:
  - **Robot locations**:
    - `robot1` is in `room2`
    - `robot2` is in `room1`
  - **Ball locations**:
    - `ball1`, `ball2`, `ball3`, `ball4`, and `ball5` are all in `room1`
  - **Gripper status**:
    - All grippers are free.

- **Goal State**:
  - **Ball locations**:
    - `ball1` should be in `room1`
    - `ball2` should be in `room1`
    - `ball3` should be in `room2`
    - `ball4` should be in `room1`
    - `ball5` should be in `room1`

This PDDL problem definition should be consistent with the domain and problem description provided. If you need further assistance or additional information, feel free to ask!