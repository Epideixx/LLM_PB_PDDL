Based on the provided information, here is the complete problem in PDDL format:

```lisp
(define (problem barman_problem)
  (:domain barman)
  (:objects
    shaker1 - shaker
    level1 level2 level3 - level
    shot1 shot2 shot3 shot4 - shot
    dispenser1 dispenser2 dispenser3 - dispenser
    ingredient1 ingredient2 ingredient3 - ingredient
    left_hand right_hand - hand
    cocktail1 cocktail2 cocktail3 - cocktail
  )
  (:init
    ;; Initial states for containers
    (clean shaker1)
    (empty shaker1)
    (ontable shaker1)
    (shaker-level shaker1 level1)

    (clean shot1)
    (empty shot1)
    (ontable shot1)
    
    (clean shot2)
    (empty shot2)
    (ontable shot2)
    
    (clean shot3)
    (empty shot3)
    (ontable shot3)
    
    (clean shot4)
    (empty shot4)
    (ontable shot4)

    ;; Initial states for hands
    (handempty left_hand)
    (handempty right_hand)

    ;; Dispensers and their ingredients
    (dispenses dispenser1 ingredient1)
    (dispenses dispenser2 ingredient2)
    (dispenses dispenser3 ingredient3)

    ;; Cocktail recipes
    (cocktail-part1 cocktail1 ingredient3)
    (cocktail-part2 cocktail1 ingredient1)

    (cocktail-part1 cocktail2 ingredient3)
    (cocktail-part2 cocktail2 ingredient2)

    (cocktail-part1 cocktail3 ingredient3)
    (cocktail-part2 cocktail3 ingredient1)

    ;; Levels
    (next level1 level2)
    (next level2 level3)
  )
  (:goal (and
    (contains shot1 cocktail1)
    (contains shot2 cocktail3)
    (contains shot3 cocktail2)
  ))
)
```

### Explanation:

**Objects:**
- All the objects are listed with their respective types: shaker, level, shot, dispenser, ingredient, hand, and cocktail.

**Initial State:**
- All the initial conditions are described:
  - Shaker and shot glasses are clean, empty, and on the table.
  - Levels are defined for the shaker.
  - Both hands are empty.
  - Dispensers are associated with their respective ingredients.
  - The ingredients required for each cocktail are specified.
  - The level transitions are defined.

**Goal State:**
- The goal state specifies that shot1 should contain cocktail1, shot2 should contain cocktail3, and shot3 should contain cocktail2.

This PDDL problem definition captures the initial conditions and the goal conditions clearly, adhering to the rules and structure of PDDL.