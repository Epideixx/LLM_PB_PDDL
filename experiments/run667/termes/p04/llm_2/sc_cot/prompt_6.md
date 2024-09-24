Certainly! Let's write the complete problem PDDL based on the provided domain and problem description.

### Problem PDDL

```lisp
(define (problem term_problem)
   (:domain termes)
   
   (:objects
     pos-0-0 pos-0-1 pos-0-2
     pos-1-0 pos-1-1 pos-1-2
     pos-2-0 pos-2-1 pos-2-2
     pos-3-0 pos-3-1 pos-3-2 - position
     h1 h2 h3 h4 - numb
   )

   (:init
     ;; Initial positions and heights
     (at pos-1-0)
     (IS-DEPOT pos-1-0)
     
     ;; Heights at all positions (initially all zero)
     (height pos-0-0 h1)
     (height pos-0-1 h1)
     (height pos-0-2 h1)
     (height pos-1-0 h1)
     (height pos-1-1 h1)
     (height pos-1-2 h1)
     (height pos-2-0 h1)
     (height pos-2-1 h1)
     (height pos-2-2 h1)
     (height pos-3-0 h1)
     (height pos-3-1 h1)
     (height pos-3-2 h1)

     ;; Neighbor positions
     (NEIGHBOR pos-0-0 pos-0-1)
     (NEIGHBOR pos-0-1 pos-0-0)
     (NEIGHBOR pos-0-1 pos-0-2)
     (NEIGHBOR pos-0-2 pos-0-1)
     (NEIGHBOR pos-0-0 pos-1-0)
     (NEIGHBOR pos-1-0 pos-0-0)
     (NEIGHBOR pos-0-1 pos-1-1)
     (NEIGHBOR pos-1-1 pos-0-1)
     (NEIGHBOR pos-0-2 pos-1-2)
     (NEIGHBOR pos-1-2 pos-0-2)
     (NEIGHBOR pos-1-0 pos-1-1)
     (NEIGHBOR pos-1-1 pos-1-0)
     (NEIGHBOR pos-1-1 pos-1-2)
     (NEIGHBOR pos-1-2 pos-1-1)
     (NEIGHBOR pos-1-0 pos-2-0)
     (NEIGHBOR pos-2-0 pos-1-0)
     (NEIGHBOR pos-1-1 pos-2-1)
     (NEIGHBOR pos-2-1 pos-1-1)
     (NEIGHBOR pos-1-2 pos-2-2)
     (NEIGHBOR pos-2-2 pos-1-2)
     (NEIGHBOR pos-2-0 pos-2-1)
     (NEIGHBOR pos-2-1 pos-2-0)
     (NEIGHBOR pos-2-1 pos-2-2)
     (NEIGHBOR pos-2-2 pos-2-1)
     (NEIGHBOR pos-2-0 pos-3-0)
     (NEIGHBOR pos-3-0 pos-2-0)
     (NEIGHBOR pos-2-1 pos-3-1)
     (NEIGHBOR pos-3-1 pos-2-1)
     (NEIGHBOR pos-2-2 pos-3-2)
     (NEIGHBOR pos-3-2 pos-2-2)
     (NEIGHBOR pos-3-0 pos-3-1)
     (NEIGHBOR pos-3-1 pos-3-0)
     (NEIGHBOR pos-3-1 pos-3-2)
     (NEIGHBOR pos-3-2 pos-3-1)

     ;; Successor relationships for heights
     (SUCC h1 h2)
     (SUCC h2 h3)
     (SUCC h3 h4)
   )

   (:goal
     (and
       ;; Goal heights
       (height pos-2-0 h3)
       (height pos-3-2 h4)
       ;; Heights at other positions remain unchanged
       (height pos-0-0 h1)
       (height pos-0-1 h1)
       (height pos-0-2 h1)
       (height pos-1-0 h1)
       (height pos-1-1 h1)
       (height pos-1-2 h1)
       (height pos-2-1 h1)
       (height pos-2-2 h1)
       (height pos-3-0 h1)
       (height pos-3-1 h1)
       ;; No unplaced blocks
       (not (has-block))
     )
   )
)
```

### Explanation:

#### Objects:
- **Positions:** All positions on the grid (pos-0-0, pos-0-1, pos-0-2, etc.).
- **Numerical Values (numb):** Heights from h1 to h4.

#### Initial State:
- The robot starts at position pos-1-0.
- The depot for new blocks is at pos-1-0, denoted by the predicate `(IS-DEPOT pos-1-0)`.
- Initial heights for all positions are set to h1 (representing height 0).
- Neighbor relationships between positions are defined using the `NEIGHBOR` predicate.
- Successor relationships for heights are defined using the `SUCC` predicate.

#### Goal State:
- The height at pos-2-0 should be h3 (representing height 3).
- The height at pos-3-2 should be h4 (representing height 4).
- Heights at all other positions should remain h1 (unchanged from the initial state).
- No unplaced blocks should remain at the end, ensured by the predicate `(not (has-block))`.

This complete problem PDDL captures all the initial conditions, goal conditions, and relationships as described in the problem statement.