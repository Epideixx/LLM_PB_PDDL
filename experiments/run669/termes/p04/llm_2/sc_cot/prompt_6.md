Based on the information provided and the domain PDDL, here is the complete problem formulation using the PDDL language:

```lisp
(define (problem block-building) 
   (:domain termes)
   (:objects 
      pos-0-0 pos-0-1 pos-0-2
      pos-1-0 pos-1-1 pos-1-2
      pos-2-0 pos-2-1 pos-2-2
      pos-3-0 pos-3-1 pos-3-2 - position
      h0 h1 h2 h3 h4 - numb
   )
   (:init 
      (at pos-1-0) 
      (IS-DEPOT pos-1-0)
      (height pos-0-0 h0) (height pos-0-1 h0) (height pos-0-2 h0)
      (height pos-1-0 h0) (height pos-1-1 h0) (height pos-1-2 h0)
      (height pos-2-0 h0) (height pos-2-1 h0) (height pos-2-2 h0)
      (height pos-3-0 h0) (height pos-3-1 h0) (height pos-3-2 h0)
      (SUCC h0 h1) (SUCC h1 h2) (SUCC h2 h3) (SUCC h3 h4)
      (NEIGHBOR pos-0-0 pos-0-1) (NEIGHBOR pos-0-1 pos-0-2)
      (NEIGHBOR pos-1-0 pos-1-1) (NEIGHBOR pos-1-1 pos-1-2)
      (NEIGHBOR pos-2-0 pos-2-1) (NEIGHBOR pos-2-1 pos-2-2)
      (NEIGHBOR pos-3-0 pos-3-1) (NEIGHBOR pos-3-1 pos-3-2)
      (NEIGHBOR pos-0-0 pos-1-0) (NEIGHBOR pos-1-0 pos-2-0) (NEIGHBOR pos-2-0 pos-3-0)
      (NEIGHBOR pos-0-1 pos-1-1) (NEIGHBOR pos-1-1 pos-2-1) (NEIGHBOR pos-2-1 pos-3-1)
      (NEIGHBOR pos-0-2 pos-1-2) (NEIGHBOR pos-1-2 pos-2-2) (NEIGHBOR pos-2-2 pos-3-2)
      (NEIGHBOR pos-0-1 pos-0-0) (NEIGHBOR pos-0-2 pos-0-1)
      (NEIGHBOR pos-1-1 pos-1-0) (NEIGHBOR pos-1-2 pos-1-1)
      (NEIGHBOR pos-2-1 pos-2-0) (NEIGHBOR pos-2-2 pos-2-1)
      (NEIGHBOR pos-3-1 pos-3-0) (NEIGHBOR pos-3-2 pos-3-1)
      (NEIGHBOR pos-1-0 pos-0-0) (NEIGHBOR pos-2-0 pos-1-0) (NEIGHBOR pos-3-0 pos-2-0)
      (NEIGHBOR pos-1-1 pos-0-1) (NEIGHBOR pos-2-1 pos-1-1) (NEIGHBOR pos-3-1 pos-2-1)
      (NEIGHBOR pos-1-2 pos-0-2) (NEIGHBOR pos-2-2 pos-1-2) (NEIGHBOR pos-3-2 pos-2-2)
   )
   (:goal 
      (and 
         (height pos-2-0 h3)
         (height pos-3-2 h4)
         (not (has-block))
         (at pos-1-0) ;; Assuming the robot returns to the initial position
         (height pos-0-0 h0) (height pos-0-1 h0) (height pos-0-2 h0)
         (height pos-1-0 h0) (height pos-1-1 h0) (height pos-1-2 h0)
         (height pos-2-1 h0) (height pos-2-2 h0)
         (height pos-3-0 h0) (height pos-3-1 h0)
      )
   )
)
```

### Explanation:
1. **Objects:**
   - Defined positions on the grid and numerical values for heights.

2. **Initialization (`:init`):**
   - The robot starts at position `pos-1-0`.
   - The depot for new blocks is at position `pos-1-0`.
   - All positions initially have height zero.
   - Successor relationships for numerical values.
   - Neighbor relationships for grid positions, both horizontally and vertically.

3. **Goal (`:goal`):**
   - The height at position `pos-2-0` must be 3.
   - The height at position `pos-3-2` must be 4.
   - The robot should not have any blocks at the end.
   - The robot should be at position `pos-1-0` (assuming it returns to the initial position).
   - Heights at other positions remain unchanged (zero).

This PDDL problem definition encapsulates the initial and goal states as described in the problem statement.