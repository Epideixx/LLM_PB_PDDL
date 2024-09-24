### PDDL Problem Definition

Using the previous information, here is the PDDL representation of the problem:

```pddl
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
```

### Explanation of the PDDL Problem

#### Objects
- **Robots**: `robot1`, `robot2`
- **Grippers**: `left_gripper1`, `right_gripper1`, `left_gripper2`, `right_gripper2`
- **Rooms**: `room1`, `room2`
- **Balls (objects)**: `ball1`, `ball2`, `ball3`, `ball4`, `ball5`

#### Initial State
- **Robot Locations**:
  - `robot2` is in `room1`.
  - `robot1` is in `room2`.
- **Ball Locations**:
  - `ball1` is in `room1`.
  - `ball2` is in `room1`.
  - `ball3` is in `room1`.
  - `ball4` is in `room1`.
  - `ball5` is in `room1`.
- **Gripper Status**:
  - `left_gripper1` and `right_gripper1` of `robot1` are free.
  - `left_gripper2` and `right_gripper2` of `robot2` are free.

#### Goal State
- **Ball Locations**:
  - `ball1` should be in `room1`.
  - `ball2` should be in `room1`.
  - `ball3` should be in `room2`.
  - `ball4` should be in `room1`.
  - `ball5` should be in `room1`.

This PDDL problem definition sets up the initial state and the goal state, defining the objects, their initial configurations, and the desired end configurations for the balls.