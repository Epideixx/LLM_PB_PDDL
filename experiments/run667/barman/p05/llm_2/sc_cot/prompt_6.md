Based on the provided text, let's translate the problem into PDDL:

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
    left_hand right_hand - hand)

  (:init
    ;; Initial states for containers
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

    ;; Initial states for hands
    (handempty left_hand)
    (handempty right_hand)

    ;; Dispensers dispensing ingredients
    (dispenses dispenser1 ingredient1)
    (dispenses dispenser2 ingredient2)
    (dispenses dispenser3 ingredient3)

    ;; Shaker levels
    (shaker-level shaker1 level1)
    (next level1 level2)
    (next level2 level3)

    ;; Ingredients in cocktails
    (cocktail-part1 cocktail1 ingredient2)
    (cocktail-part2 cocktail1 ingredient1)

    (cocktail-part1 cocktail2 ingredient1)
    (cocktail-part2 cocktail2 ingredient2)

    (cocktail-part1 cocktail3 ingredient1)
    (cocktail-part2 cocktail3 ingredient3)

    (cocktail-part1 cocktail4 ingredient3)
    (cocktail-part2 cocktail4 ingredient2))

  (:goal
    (and
      (contains shot1 cocktail1)
      (contains shot2 cocktail4)
      (contains shot3 cocktail3)
      (contains shot4 cocktail2))))
```

### Explanation:

#### Objects:
- **Shaker**: `shaker1`
- **Levels**: `level1`, `level2`, `level3`
- **Shot Glasses**: `shot1`, `shot2`, `shot3`, `shot4`, `shot5`
- **Dispensers**: `dispenser1`, `dispenser2`, `dispenser3`
- **Ingredients**: `ingredient1`, `ingredient2`, `ingredient3`
- **Cocktails**: `cocktail1`, `cocktail2`, `cocktail3`, `cocktail4`
- **Hands**: `left_hand`, `right_hand`

#### Initial State:
- The shaker and shot glasses are clean, empty, and on the table.
- Both hands are empty.
- Each dispenser dispenses a specific ingredient.
- The shaker has three levels.
- The ingredients required for each cocktail are specified.

#### Goal State:
- `shot1` contains `cocktail1` (ingredient2, ingredient1).
- `shot2` contains `cocktail4` (ingredient3, ingredient2).
- `shot3` contains `cocktail3` (ingredient1, ingredient3).
- `shot4` contains `cocktail2` (ingredient1, ingredient2).

This PDDL problem definition should now be complete and align with the domain and problem described.