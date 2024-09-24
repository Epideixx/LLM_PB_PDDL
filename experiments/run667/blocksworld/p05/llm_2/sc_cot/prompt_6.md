Here is the complete problem definition in PDDL for the given blocksworld scenario:

```lisp
(define (problem blocksworld-problem)
    (:domain blocksworld-4ops)
    (:objects b1 b2 b3 b4 b5)  ;; Define the blocks

    (:init 
        ;; Initial positions of the blocks
        (on b4 b1)
        (on b2 b3)
        (on b3 b5)
        (on b1 b2)
        (on-table b5)

        ;; Clear status
        (clear b4)

        ;; Arm status
        (arm-empty)
    )

    (:goal 
        (and
            ;; Goal positions of the blocks
            (on b1 b3)
            (on b3 b5)
        )
    )
)
```

### Explanation

- **Objects:**
  - `b1`, `b2`, `b3`, `b4`, `b5` are the blocks.

- **Initial State:**
  - `b4` is on top of `b1` (represented by `(on b4 b1)`).
  - `b2` is on top of `b3` (represented by `(on b2 b3)`).
  - `b3` is on top of `b5` (represented by `(on b3 b5)`).
  - `b1` is on top of `b2` (represented by `(on b1 b2)`).
  - `b5` is on the table (represented by `(on-table b5)`).
  - `b4` is clear (represented by `(clear b4)`).
  - The robotic arm is empty (represented by `(arm-empty)`).

- **Goal State:**
  - `b1` should be on top of `b3` (represented by `(on b1 b3)`).
  - `b3` should be on top of `b5` (represented by `(on b3 b5)`).

This PDDL problem definition captures the initial and goal states as described in the natural language text.