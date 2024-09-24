Sure, let's translate the provided text into a proper PDDL problem description.

### Problem PDDL

```lisp
(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)

  ;; Declare Objects
  (:objects b1 b2 b3 - block)

  ;; Initial State
  (:init
    (on b2 b3)
    (on b3 b1)
    (on-table b1)
    (clear b2)
    (arm-empty)
  )

  ;; Goal State
  (:goal
    (and
      (on b2 b3)
      (on b3 b1)
    )
  )
)
```

### Breakdown of the Problem PDDL

- **Problem Definition**:
  ```lisp
  (define (problem blocksworld-problem)
    (:domain blocksworld-4ops)
  ```

- **Objects Declaration**:
  ```lisp
  (:objects b1 b2 b3 - block)
  ```
  This specifies that there are three objects of type `block`, namely `b1`, `b2`, and `b3`.

- **Initial State**:
  ```lisp
  (:init
    (on b2 b3)
    (on b3 b1)
    (on-table b1)
    (clear b2)
    (arm-empty)
  )
  ```
  This describes the initial conditions:
  - `(on b2 b3)`: Block `b2` is on top of block `b3`.
  - `(on b3 b1)`: Block `b3` is on top of block `b1`.
  - `(on-table b1)`: Block `b1` is on the table.
  - `(clear b2)`: Block `b2` is clear (no block on top of it).
  - `(arm-empty)`: The robot's arm is empty.

- **Goal State**:
  ```lisp
  (:goal
    (and
      (on b2 b3)
      (on b3 b1)
    )
  )
  ```
  This describes the desired end state:
  - `(on b2 b3)`: Block `b2` should be on top of block `b3`.
  - `(on b3 b1)`: Block `b3` should be on top of block `b1`.

This PDDL problem captures the initial configuration of the blocks and the goal configuration as described in the text.