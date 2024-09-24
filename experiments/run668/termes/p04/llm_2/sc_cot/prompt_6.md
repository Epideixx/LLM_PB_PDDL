Based on the given problem and the domain PDDL, here is the complete problem formulation in PDDL language:

```lisp
(define (problem grid_block_problem)
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
    (NEIGHBOR pos-0-0 pos-1-0) (NEIGHBOR pos-0-1 pos-1-1) (NEIGHBOR pos-0-2 pos-1-2)
    (NEIGHBOR pos-1-0 pos-2-0) (NEIGHBOR pos-1-1 pos-2-1) (NEIGHBOR pos-1-2 pos-2-2)
    (NEIGHBOR pos-2-0 pos-3-0) (NEIGHBOR pos-2-1 pos-3-1) (NEIGHBOR pos-2-2 pos-3-2)
    (NEIGHBOR pos-0-1 pos-0-0) (NEIGHBOR pos-0-2 pos-0-1)
    (NEIGHBOR pos-1-1 pos-1-0) (NEIGHBOR pos-1-2 pos-1-1)
    (NEIGHBOR pos-2-1 pos-2-0) (NEIGHBOR pos-2-2 pos-2-1)
    (NEIGHBOR pos-3-1 pos-3-0) (NEIGHBOR pos-3-2 pos-3-1)
    (NEIGHBOR pos-1-0 pos-0-0) (NEIGHBOR pos-1-1 pos-0-1) (NEIGHBOR pos-1-2 pos-0-2)
    (NEIGHBOR pos-2-0 pos-1-0) (NEIGHBOR pos-2-1 pos-1-1) (NEIGHBOR pos-2-2 pos-1-2)
    (NEIGHBOR pos-3-0 pos-2-0) (NEIGHBOR pos-3-1 pos-2-1) (NEIGHBOR pos-3-2 pos-2-2)
  )
  (:goal
    (and
      (height pos-2-0 h3)
      (height pos-3-2 h4)
      (not (has-block))
    )
  )
)
```

### Explanation:
- **Objects:**
  - `position` objects: All grid positions from `pos-0-0` to `pos-3-2`.
  - `numb` objects: Heights from `h0` to `h4` (representing 0 to 4).

- **Initial State:**
  - The robot starts at `pos-1-0`.
  - The depot is at `pos-1-0`.
  - All grid positions initially have height `h0` (0).
  - Successor relationships between heights: `h0` is followed by `h1` (1), `h1` by `h2` (2), `h2` by `h3` (3), and `h3` by `h4` (4).
  - Neighbor relationships between all adjacent positions on the grid.

- **Goal State:**
  - Height at `pos-2-0` is `h3` (3).
  - Height at `pos-3-2` is `h4` (4).
  - The robot does not have an unplaced block.

This PDDL problem definition follows the rules and constraints extracted from the domain and problem description. If you have any further questions or need additional details, feel free to ask!