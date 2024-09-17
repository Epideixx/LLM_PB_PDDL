Based on the provided text, here is the complete PDDL problem definition:

```pddl
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
    ;; Shaker and shot glasses
    (clean shaker1) (empty shaker1) (ontable shaker1)
    (clean shot1) (empty shot1) (ontable shot1)
    (clean shot2) (empty shot2) (ontable shot2)
    (clean shot3) (empty shot3) (ontable shot3)
    (clean shot4) (empty shot4) (ontable shot4)
    (clean shot5) (empty shot5) (ontable shot5)

    ;; Hands
    (handempty left_hand)
    (handempty right_hand)

    ;; Dispensers and Ingredients
    (dispenses dispenser1 ingredient1)
    (dispenses dispenser2 ingredient2)
    (dispenses dispenser3 ingredient3)

    ;; Levels
    (next level1 level2)
    (next level2 level3)

    ;; Cocktail recipes
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

#### Objects:
- **Shaker**: `shaker1`
- **Levels**: `level1`, `level2`, `level3`
- **Shot Glasses**: `shot1`, `shot2`, `shot3`, `shot4`, `shot5`
- **Dispensers**: `dispenser1`, `dispenser2`, `dispenser3`
- **Ingredients**: `ingredient1`, `ingredient2`, `ingredient3`
- **Cocktails**: `cocktail1`, `cocktail2`, `cocktail3`, `cocktail4`
- **Hands**: `left_hand`, `right_hand`

#### Initial State:
- The shaker (`shaker1`) and shot glasses (`shot1` to `shot5`) are clean, empty, and on the table (`ontable`).
- Both hands (`left_hand` and `right_hand`) are empty.
- Each dispenser can dispense a specific ingredient.
- Defined the levels with a `next` relationship between them.
- Defined the recipes for each cocktail, indicating the first and second ingredients.

#### Goal State:
- The goal is to ensure that:
  - `shot1` contains `cocktail1`.
  - `shot2` contains `cocktail4`.
  - `shot3` contains `cocktail3`.
  - `shot4` contains `cocktail2`.

This PDDL problem definition captures the initial conditions and the desired goal state based on the provided text.