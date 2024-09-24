Let's translate the given problem description into a PDDL problem file.

### Problem Description:

Text:
- You have 5 blocks.
- b4 is on top of b1.
- b2 is on top of b3.
- b3 is on top of b5.
- b1 is on top of b2.
- b5 is on the table.
- b4 is clear.
- Your arm is empty.
- Your goal is to move the blocks.
- b1 should be on top of b3.
- b3 should be on top of b5.

### PDDL Problem File:

```pddl
(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)
  (:objects b1 b2 b3 b4 b5 - block)
  
  (:init
    (on b4 b1)
    (on b1 b2)
    (on b2 b3)
    (on b3 b5)
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

### Explanation:

1. **Objects:**
   - We declare the objects `b1`, `b2`, `b3`, `b4`, and `b5` of type `block`.

2. **Initial State:**
   - `(on b4 b1)` means b4 is on top of b1.
   - `(on b1 b2)` means b1 is on top of b2.
   - `(on b2 b3)` means b2 is on top of b3.
   - `(on b3 b5)` means b3 is on top of b5.
   - `(on-table b5)` means b5 is on the table.
   - `(clear b4)` means b4 is clear (nothing on top of it).
   - `(arm-empty)` means the robotic arm is empty.

3. **Goal State:**
   - `(on b1 b3)` means b1 should be on top of b3.
   - `(on b3 b5)` means b3 should be on top of b5.

This PDDL problem file captures the initial and goal states as described in the problem text.