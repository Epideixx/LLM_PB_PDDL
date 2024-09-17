Based on the provided text and the domain PDDL, here is the complete problem in PDDL format:

```lisp
(define (problem barman_problem)
  (:domain barman)
  (:objects 
    shaker1 - shaker
    level1 level2 level3 - level
    shot1 shot2 shot3 shot4 shot5 - shot
    dispenser1 dispenser2 dispenser3 - dispenser
    ingredient1 ingredient2 ingredient3 - ingredient
    cocktail1 cocktail2 cocktail3 cocktail4 - cocktail
    left_hand right_hand - hand
  )
  (:init 
    ;; Shaker initial state
    (ontable shaker1)
    (clean shaker1)
    (empty shaker1)
    (shaker-level shaker1 level1)
    
    ;; Shot glasses initial state
    (ontable shot1)
    (ontable shot2)
    (ontable shot3)
    (ontable shot4)
    (ontable shot5)
    (clean shot1)
    (clean shot2)
    (clean shot3)
    (clean shot4)
    (clean shot5)
    (empty shot1)
    (empty shot2)
    (empty shot3)
    (empty shot4)
    (empty shot5)
    
    ;; Hands initial state
    (handempty left_hand)
    (handempty right_hand)
    
    ;; Dispensers initial state
    (dispenses dispenser1 ingredient1)
    (dispenses dispenser2 ingredient2)
    (dispenses dispenser3 ingredient3)
    
    ;; Levels relationship
    (next level1 level2)
    (next level2 level3)
    
    ;; Cocktail ingredients
    (cocktail-part1 cocktail1 ingredient2)
    (cocktail-part2 cocktail1 ingredient1)
    (cocktail-part1 cocktail2 ingredient1)
    (cocktail-part2 cocktail2 ingredient2)
    (cocktail-part1 cocktail3 ingredient1)
    (cocktail-part2 cocktail3 ingredient3)
    (cocktail-part1 cocktail4 ingredient3)
    (cocktail-part2 cocktail4 ingredient2)
  )
  (:goal 
    (and 
      (contains shot1 cocktail1)
      (contains shot2 cocktail4)
      (contains shot3 cocktail3)
      (contains shot4 cocktail2)
    )
  )
)
```

### Explanation:

1. **Objects**:
   - Defined the objects for each type: shaker, levels, shot glasses, dispensers, ingredients, cocktails, and hands.

2. **Initial State**:
   - Shaker: The shaker is clean, empty, on the table, and at the initial level (level1).
   - Shot Glasses: All shot glasses are clean, empty, and on the table.
   - Hands: Both hands are empty.
   - Dispensers: Each dispenser can dispense a specific ingredient.
   - Levels: Defined the relationship between levels using the `next` predicate.
   - Cocktails: Defined the ingredients required for each cocktail.

3. **Goal State**:
   - Specified that each shot glass should contain the corresponding cocktail as per the goal description.

This PDDL problem definition accurately reflects the initial and goal states based on the provided text and the domain structure.