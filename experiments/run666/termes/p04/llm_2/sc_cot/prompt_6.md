Based on the provided information and the rules outlined, here is the complete PDDL problem for the given domain:

```lisp
(define (problem termes_prob)
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
    (NEIGHBOR pos-0-0 pos-0-1) (NEIGHBOR pos-0-0 pos-1-0)
    (NEIGHBOR pos-0-1 pos-0-0) (NEIGHBOR pos-0-1 pos-0-2) (NEIGHBOR pos-0-1 pos-1-1)
    (NEIGHBOR pos-0-2 pos-0-1) (NEIGHBOR pos-0-2 pos-1-2)
    (NEIGHBOR pos-1-0 pos-0-0) (NEIGHBOR pos-1-0 pos-1-1) (NEIGHBOR pos-1-0 pos-2-0)
    (NEIGHBOR pos-1-1 pos-0-1) (NEIGHBOR pos-1-1 pos-1-0) (NEIGHBOR pos-1-1 pos-1-2) (NEIGHBOR pos-1-1 pos-2-1)
    (NEIGHBOR pos-1-2 pos-0-2) (NEIGHBOR pos-1-2 pos-1-1) (NEIGHBOR pos-1-2 pos-2-2)
    (NEIGHBOR pos-2-0 pos-1-0) (NEIGHBOR pos-2-0 pos-2-1) (NEIGHBOR pos-2-0 pos-3-0)
    (NEIGHBOR pos-2-1 pos-1-1) (NEIGHBOR pos-2-1 pos-2-0) (NEIGHBOR pos-2-1 pos-2-2) (NEIGHBOR pos-2-1 pos-3-1)
    (NEIGHBOR pos-2-2 pos-1-2) (NEIGHBOR pos-2-2 pos-2-1) (NEIGHBOR pos-2-2 pos-3-2)
    (NEIGHBOR pos-3-0 pos-2-0) (NEIGHBOR pos-3-0 pos-3-1)
    (NEIGHBOR pos-3-1 pos-2-1) (NEIGHBOR pos-3-1 pos-3-0) (NEIGHBOR pos-3-1 pos-3-2)
    (NEIGHBOR pos-3-2 pos-2-2) (NEIGHBOR pos-3-2 pos-3-1)
    (SUCC h0 h1) (SUCC h1 h2) (SUCC h2 h3) (SUCC h3 h4)
  )
  (:goal 
    (and 
      (height pos-2-0 h3)
      (height pos-3-2 h4)
      (at pos-1-0)
      (not (has-block))
    )
  )
)
```

### Explanation:
- **Objects:**
  - Positions: `pos-0-0` to `pos-3-2` are defined as objects of type `position`.
  - Heights: `h0` to `h4` are defined as objects of type `numb`.

- **Initial State:**
  - The robot is initially at `pos-1-0`.
  - `pos-1-0` is marked as a depot (`IS-DEPOT pos-1-0`).
  - All positions start with an initial height of `h0`.
  - Neighbor relationships are defined between all adjacent positions in the grid.
  - Successor relationships (`SUCC`) are defined for heights from `h0` to `h4`.

- **Goal State:**
  - The height at `pos-2-0` should be `h3`.
  - The height at `pos-3-2` should be `h4`.
  - The robot should be at `pos-1-0`.
  - The robot should not have an unplaced block (`not (has-block)`).

This PDDL problem formulation captures the initial conditions, the relationships between the positions, the requirements for block heights, and the goal state as described in the natural language problem.