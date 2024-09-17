Based on the provided information and the rules, here is the complete problem PDDL:

```lisp
(define (problem build_blocks)
  (:domain termes)
  (:objects 
    pos-0-0 pos-0-1 pos-0-2 
    pos-1-0 pos-1-1 pos-1-2 
    pos-2-0 pos-2-1 pos-2-2 
    pos-3-0 pos-3-1 pos-3-2 - position
    h0 h1 h2 h3 - numb
  )
  (:init
    ; Initial robot position
    (at pos-2-0)
    
    ; Depot location
    (IS-DEPOT pos-2-0)
    
    ; Initial heights (assuming all are initially 0)
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
    
    ; SUCC predicates to define the successor relation
    (SUCC h0 h1)
    (SUCC h1 h2)
    (SUCC h2 h3)
    
    ; NEIGHBOR predicates to define neighboring positions
    (NEIGHBOR pos-0-0 pos-0-1)
    (NEIGHBOR pos-0-1 pos-0-0)
    (NEIGHBOR pos-0-1 pos-0-2)
    (NEIGHBOR pos-0-2 pos-0-1)
    
    (NEIGHBOR pos-1-0 pos-1-1)
    (NEIGHBOR pos-1-1 pos-1-0)
    (NEIGHBOR pos-1-1 pos-1-2)
    (NEIGHBOR pos-1-2 pos-1-1)
    
    (NEIGHBOR pos-2-0 pos-2-1)
    (NEIGHBOR pos-2-1 pos-2-0)
    (NEIGHBOR pos-2-1 pos-2-2)
    (NEIGHBOR pos-2-2 pos-2-1)
    
    (NEIGHBOR pos-3-0 pos-3-1)
    (NEIGHBOR pos-3-1 pos-3-0)
    (NEIGHBOR pos-3-1 pos-3-2)
    (NEIGHBOR pos-3-2 pos-3-1)
    
    (NEIGHBOR pos-0-0 pos-1-0)
    (NEIGHBOR pos-1-0 pos-0-0)
    
    (NEIGHBOR pos-0-1 pos-1-1)
    (NEIGHBOR pos-1-1 pos-0-1)
    
    (NEIGHBOR pos-0-2 pos-1-2)
    (NEIGHBOR pos-1-2 pos-0-2)
    
    (NEIGHBOR pos-1-0 pos-2-0)
    (NEIGHBOR pos-2-0 pos-1-0)
    
    (NEIGHBOR pos-1-1 pos-2-1)
    (NEIGHBOR pos-2-1 pos-1-1)
    
    (NEIGHBOR pos-1-2 pos-2-2)
    (NEIGHBOR pos-2-2 pos-1-2)
    
    (NEIGHBOR pos-2-0 pos-3-0)
    (NEIGHBOR pos-3-0 pos-2-0)
    
    (NEIGHBOR pos-2-1 pos-3-1)
    (NEIGHBOR pos-3-1 pos-2-1)
    
    (NEIGHBOR pos-2-2 pos-3-2)
    (NEIGHBOR pos-3-2 pos-2-2)
  )
  (:goal
    (and
      ; Goal heights
      (height pos-2-1 h3)
      (height pos-3-0 h3)
      
      ; Ensure no unplaced blocks
      (not (has-block))
    )
  )
)
```

### Explanation:
1. **Objects:**
   - Defined all positions `pos-0-0` to `pos-3-2`.
   - Defined numerical values `h0` to `h3` to represent heights.

2. **Initial State:**
   - The robot is initially at `pos-2-0`.
   - `pos-2-0` is marked as the depot.
   - Initial heights of all positions are assumed to be `h0` (0).
   - Defined the `SUCC` relation to establish successor heights.
   - Defined `NEIGHBOR` relations to indicate which positions are neighbors.

3. **Goal State:**
   - The height at `pos-2-1` should be `h3` (3).
   - The height at `pos-3-0` should be `h3` (3).
   - The robot should not have any unplaced blocks at the end.

This PDDL problem definition encapsulates all the information and constraints provided in the natural language description.