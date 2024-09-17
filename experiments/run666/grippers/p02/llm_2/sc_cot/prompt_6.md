Given the provided domain and problem description, here's the complete problem definition in PDDL:

```pddl
(define (problem gripper_problem)
  (:domain gripper-strips)
  (:objects 
    robot1 robot2 - robot
    room1 room2 room3 - room
    ball1 ball2 ball3 ball4 - object
    robot1-left-gripper robot1-right-gripper robot2-left-gripper robot2-right-gripper - gripper
  )
  (:init 
    ;; Robot locations
    (at-robby robot1 room2)
    (at-robby robot2 room3)
    
    ;; Ball locations
    (at ball1 room3)
    (at ball2 room1)
    (at ball3 room1)
    (at ball4 room3)
    
    ;; Gripper states
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

#### Objects
- **Robots**: `robot1`, `robot2`
- **Rooms**: `room1`, `room2`, `room3`
- **Balls**: `ball1`, `ball2`, `ball3`, `ball4`
- **Grippers**: `robot1-left-gripper`, `robot1-right-gripper`, `robot2-left-gripper`, `robot2-right-gripper`

#### Initial State
- **Robot Locations**:
  - `robot1` is in `room2`.
  - `robot2` is in `room3`.

- **Ball Locations**:
  - `ball1` is in `room3`.
  - `ball2` is in `room1`.
  - `ball3` is in `room1`.
  - `ball4` is in `room3`.

- **Gripper States**:
  - `robot1-left-gripper` and `robot1-right-gripper` of `robot1` are free.
  - `robot2-left-gripper` and `robot2-right-gripper` of `robot2` are free.

#### Goal State
- `ball1` should be in `room2`.
- `ball2` should be in `room2`.
- `ball3` should be in `room3`.
- `ball4` should be in `room3`.

This PDDL problem definition sets up the initial conditions and specifies the goal to be achieved, consistent with the provided domain and problem description.