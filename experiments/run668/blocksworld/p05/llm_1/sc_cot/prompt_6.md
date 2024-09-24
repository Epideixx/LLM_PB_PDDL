Sure, let's create the PDDL problem file for the given `blocksworld-4ops` domain based on the provided text.

### Problem Description in PDDL

```lisp
(define (problem blocksworld_problem)
  (:domain blocksworld-4ops)
  (:objects 
    b1 b2 b3 b4 b5 ;; blocks
  )
  (:init 
    ;; Initial state
    (on b4 b1)
    (on b2 b3)
    (on b3 b5)
    (on b1 b2)
    (on-table b5)
    (clear b4)
    (arm-empty)
  )
  (:goal 
    (and 
      (on b1 b3)
      (on b3 b5)
    )
  )
)
```

### Explanation

- **Objects:**
  - We define the objects `b1`, `b2`, `b3`, `b4`, and `b5` as blocks.

- **Initial State:**
  - `(on b4 b1)`: Block b4 is on top of block b1.
  - `(on b2 b3)`: Block b2 is on top of block b3.
  - `(on b3 b5)`: Block b3 is on top of block b5.
  - `(on b1 b2)`: Block b1 is on top of block b2.
  - `(on-table b5)`: Block b5 is on the table.
  - `(clear b4)`: Block b4 is clear.
  - `(arm-empty)`: The robotic arm is empty.

- **Goal State:**
  - `(on b1 b3)`: Block b1 should be on top of block b3.
  - `(on b3 b5)`: Block b3 should be on top of block b5.

This PDDL problem file captures the initial and goal states as described, ensuring the problem can be solved within the given domain constraints.