Based on the given text and the understanding of the domain and problem, here's the complete problem PDDL:

```pddl
(define (problem blocks-problem-1)
  (:domain blocksworld-4ops)

  (:objects
    b1 b2 b3 - block
  )

  (:init
    (clear b2)
    (on b2 b3)
    (on b3 b1)
    (on-table b1)
    (arm-empty)
  )

  (:goal
    (and
      (on b2 b3)
      (on b3 b1)
    )
  )
)
```

### Explanation:

1. **Problem Definition**:
   - The problem is named `blocks-problem-1`.
   - It uses the `blocksworld-4ops` domain.

2. **Objects Declaration**:
   - Three blocks are declared as objects: `b1`, `b2`, and `b3`, all of type `block`.

3. **Initial State**:
   - `(clear b2)`: Block `b2` is clear.
   - `(on b2 b3)`: Block `b2` is on top of block `b3`.
   - `(on b3 b1)`: Block `b3` is on top of block `b1`.
   - `(on-table b1)`: Block `b1` is on the table.
   - `(arm-empty)`: The robotic arm is empty.

4. **Goal State**:
   - `(on b2 b3)`: Block `b2` should be on top of block `b3`.
   - `(on b3 b1)`: Block `b3` should be on top of block `b1`.

This problem PDDL captures the initial and goal states as described in the provided text, ensuring the problem is well-defined and ready to be used with the `blocksworld-4ops` domain.