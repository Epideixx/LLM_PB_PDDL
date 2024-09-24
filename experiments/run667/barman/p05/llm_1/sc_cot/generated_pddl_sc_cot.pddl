(define (problem barman_problem)
  (:domain barman)
  (:objects
    shaker1 - shaker
    level1 level2 level3 - level
    shot1 shot2 shot3 shot4 shot5 - shot
    dispenser1 dispenser2 dispenser3 - dispenser
    ingredient1 ingredient2 ingredient3 - ingredient
    cocktail1 cocktail2 cocktail3 cocktail4 - cocktail
    left-hand right-hand - hand
  )
  (:init
    ;; Initial state of the shaker
    (clean shaker1)
    (empty shaker1)
    (ontable shaker1)
    (shaker-level shaker1 level1)
    (next level1 level2)
    (next level2 level3)

    ;; Initial state of the shot glasses
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
    (ontable shot1)
    (ontable shot2)
    (ontable shot3)
    (ontable shot4)
    (ontable shot5)

    ;; Initial state of the hands
    (handempty left-hand)
    (handempty right-hand)

    ;; Dispensers and ingredients
    (dispenses dispenser1 ingredient1)
    (dispenses dispenser2 ingredient2)
    (dispenses dispenser3 ingredient3)

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
  (:goal (and
    (contains shot1 cocktail1)
    (contains shot2 cocktail4)
    (contains shot3 cocktail3)
    (contains shot4 cocktail2)
  ))
)
