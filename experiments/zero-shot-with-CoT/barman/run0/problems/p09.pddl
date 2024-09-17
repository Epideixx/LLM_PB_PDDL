(define (problem make-cocktails)
  (:domain barman)
  (:objects
    shaker1 - shaker
    shot1 shot2 shot3 shot4 shot5 shot6 - shot
    dispenser1 dispenser2 dispenser3 - dispenser
    ingredient1 ingredient2 ingredient3 - ingredient
    cocktail1 cocktail2 cocktail3 cocktail4 cocktail5 - cocktail
    left right - hand
    level0 level1 level2 level3 - level
  )
  (:init
    (ontable shaker1)
    (clean shaker1)
    (empty shaker1)
    (shaker-level shaker1 level0)
    (next level0 level1)
    (next level1 level2)
    (next level2 level3)
    (shaker-empty-level shaker1 level0)
    
    (ontable shot1)
    (clean shot1)
    (empty shot1)
    (ontable shot2)
    (clean shot2)
    (empty shot2)
    (ontable shot3)
    (clean shot3)
    (empty shot3)
    (ontable shot4)
    (clean shot4)
    (empty shot4)
    (ontable shot5)
    (clean shot5)
    (empty shot5)
    (ontable shot6)
    (clean shot6)
    (empty shot6)
    
    (handempty left)
    (handempty right)
    
    (dispenses dispenser1 ingredient1)
    (dispenses dispenser2 ingredient2)
    (dispenses dispenser3 ingredient3)
    
    (cocktail-part1 cocktail1 ingredient1)
    (cocktail-part2 cocktail1 ingredient3)
    (cocktail-part1 cocktail2 ingredient1)
    (cocktail-part2 cocktail2 ingredient3)
    (cocktail-part1 cocktail3 ingredient1)
    (cocktail-part2 cocktail3 ingredient2)
    (cocktail-part1 cocktail4 ingredient2)
    (cocktail-part2 cocktail4 ingredient1)
    (cocktail-part1 cocktail5 ingredient2)
    (cocktail-part2 cocktail5 ingredient1)
  )
  (:goal
    (and
      (contains shot1 cocktail2)
      (contains shot2 cocktail3)
      (contains shot3 cocktail4)
      (contains shot4 cocktail1)
      (contains shot5 cocktail5)
    )
  )
)