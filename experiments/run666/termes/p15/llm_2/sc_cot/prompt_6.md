Certainly! Let's translate the problem description into PDDL format.

**Problem Text:**
```
The robot is on a grid with 4 rows and 3 columns. 
pos-0-0 pos-0-1 pos-0-2 
pos-1-0 pos-1-1 pos-1-2 
pos-2-0 pos-2-1 pos-2-2 
pos-3-0 pos-3-1 pos-3-2 
The robot is at pos-2-0. 
The depot for new blocks is at pos-2-0. 
The maximum height of blocks is 5. 
Your goal is to build blocks so that the height at pos-0-2 is 5, the height at pos-3-0 is 3, the height at pos-3-2 is 2. 
The heights at the other positions remain unchanged.
You cannot have an unplaced block at the end.
```

**PDDL Problem Definition:**

```lisp
(define (problem block_building)
  (:domain termes)
  (:objects
    pos-0-0 pos-0-1 pos-0-2
    pos-1-0 pos-1-1 pos-1-2
    pos-2-0 pos-2-1 pos-2-2
    pos-3-0 pos-3-1 pos-3-2 - position
    h0 h1 h2 h3 h4 h5 - numb
  )
  (:init
    (at pos-2-0)
    (IS-DEPOT pos-2-0)
    (height pos-0-0 h0)
    (height pos-0-1 h0)
    (height pos-0-2 h0)
    (height pos-1-0 h0)
    (height pos-1-1 h0)
    (height pos-1-2 h0)
    (height pos-2-0 h0)
    (height pos-2-1 h0)
    (height pos-2-2 h0)
    (height pos-3-0 h0)
    (height pos-3-1 h0)
    (height pos-3-2 h0)
    (SUCC h0 h1)
    (SUCC h1 h2)
    (SUCC h2 h3)
    (SUCC h3 h4)
    (SUCC h4 h5)
    (NEIGHBOR pos-0-0 pos-0-1) (NEIGHBOR pos-0-1 pos-0-0)
    (NEIGHBOR pos-0-1 pos-0-2) (NEIGHBOR pos-0-2 pos-0-1)
    (NEIGHBOR pos-1-0 pos-1-1) (NEIGHBOR pos-1-1 pos-1-0)
    (NEIGHBOR pos-1-1 pos-1-2) (NEIGHBOR pos-1-2 pos-1-1)
    (NEIGHBOR pos-2-0 pos-2-1) (NEIGHBOR pos-2-1 pos-2-0)
    (NEIGHBOR pos-2-1 pos-2-2) (NEIGHBOR pos-2-2 pos-2-1)
    (NEIGHBOR pos-3-0 pos-3-1) (NEIGHBOR pos-3-1 pos-3-0)
    (NEIGHBOR pos-3-1 pos-3-2) (NEIGHBOR pos-3-2 pos-3-1)
    (NEIGHBOR pos-0-0 pos-1-0) (NEIGHBOR pos-1-0 pos-0-0)
    (NEIGHBOR pos-0-1 pos-1-1) (NEIGHBOR pos-1-1 pos-0-1)
    (NEIGHBOR pos-0-2 pos-1-2) (NEIGHBOR pos-1-2 pos-0-2)
    (NEIGHBOR pos-1-0 pos-2-0) (NEIGHBOR pos-2-0 pos-1-0)
    (NEIGHBOR pos-1-1 pos-2-1) (NEIGHBOR pos-2-1 pos-1-1)
    (NEIGHBOR pos-1-2 pos-2-2) (NEIGHBOR pos-2-2 pos-1-2)
    (NEIGHBOR pos-2-0 pos-3-0) (NEIGHBOR pos-3-0 pos-2-0)
    (NEIGHBOR pos-2-1 pos-3-1) (NEIGHBOR pos-3-1 pos-2-1)
    (NEIGHBOR pos-2-2 pos-3-2) (NEIGHBOR pos-3-2 pos-2-2)
    ;; Add all other neighbor relationships as needed
  )
  (:goal
    (and
      (height pos-0-2 h5)
      (height pos-3-0 h3)
      (height pos-3-2 h2)
      ;; Ensure no unplaced blocks
      (not (has-block))
    )
  )
)
```

### Explanation:
1. **Objects:**
   - Positions: `pos-0-0` to `pos-3-2`.
   - Numerical values: `h0` to `h5`.

2. **Initial State:**
   - The robot is at `pos-2-0` and this position is a depot.
   - All positions have an initial height of `h0`.
   - Successor relationships between heights are defined from `h0` to `h5`.
   - Neighbor relationships between positions are defined (partial list shown, add all necessary neighbors).

3. **Goal State:**
   - Height at `pos-0-2` should be `h5`.
   - Height at `pos-3-0` should be `h3`.
   - Height at `pos-3-2` should be `h2`.
   - Ensure no unplaced blocks at the end (`not (has-block)`).

This PDDL problem definition captures the initial conditions, the objects involved, and the goal state as described.