Based on the provided problem description and the domain information, here is the complete PDDL problem formulation:

```pddl
(define (problem bartender_problem) 
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
    ;; Initial state of the shaker and shot glasses
    (clean shaker1)
    (empty shaker1)
    (ontable shaker1)

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

    (clean shot5)
    (empty shot5)
    (ontable shot5)

    ;; Initial state of the hands
    (handempty left_hand)
    (handempty right_hand)

    ;; Dispensers and ingredients
    (dispenses dispenser1 ingredient1)
    (dispenses dispenser2 ingredient2)
    (dispenses dispenser3 ingredient3)

    ;; Cocktail ingredient associations
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
- **Objects:** The objects are listed with their respective types as required by the domain.
- **Initial State:** The initial state describes the cleanliness, emptiness, and location (on the table) of the shaker and shot glasses. It also includes the state of the hands (empty) and the associations between dispensers and ingredients.
- **Cocktail Ingredients:** The `cocktail-part1` and `cocktail-part2` predicates specify the ingredients required for each cocktail.
- **Goal State:** The goal state specifies that each shot glass should contain the respective cocktail.

This PDDL problem specification matches the provided natural language problem description and adheres to the rules and constraints of the domain.