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
