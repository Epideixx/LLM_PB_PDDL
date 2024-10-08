(define (problem make-cocktails)
  (:domain barman)
  (:objects
    shaker1 - shaker
    level1 level2 level3 - level
    shot1 shot2 shot3 shot4 shot5 shot6 shot7 shot8 shot9 - shot
    dispenser1 dispenser2 dispenser3 - dispenser
    ingredient1 ingredient2 ingredient3 - ingredient
    cocktail1 cocktail2 cocktail3 cocktail4 cocktail5 cocktail6 cocktail7 cocktail8 - cocktail
    left right - hand
  )
  (:init
    (ontable shaker1)
    (clean shaker1)
    (empty shaker1)
    (shaker-level shaker1 level1)
    (next level1 level2)
    (next level2 level3)
    (shaker-empty-level shaker1 level1)
    
    (ontable shot1)
    (ontable shot2)
    (ontable shot3)
    (ontable shot4)
    (ontable shot5)
    (ontable shot6)
    (ontable shot7)
    (ontable shot8)
    (ontable shot9)
    (clean shot1)
    (clean shot2)
    (clean shot3)
    (clean shot4)
    (clean shot5)
    (clean shot6)
    (clean shot7)
    (clean shot8)
    (clean shot9)
    (empty shot1)
    (empty shot2)
    (empty shot3)
    (empty shot4)
    (empty shot5)
    (empty shot6)
    (empty shot7)
    (empty shot8)
    (empty shot9)
    
    (handempty left)
    (handempty right)
    
    (dispenses dispenser1 ingredient1)
    (dispenses dispenser2 ingredient2)
    (dispenses dispenser3 ingredient3)
    
    (cocktail-part1 cocktail1 ingredient1)
    (cocktail-part2 cocktail1 ingredient2)
    (cocktail-part1 cocktail2 ingredient2)
    (cocktail-part2 cocktail2 ingredient3)
    (cocktail-part1 cocktail3 ingredient1)
    (cocktail-part2 cocktail3 ingredient2)
    (cocktail-part1 cocktail4 ingredient3)
    (cocktail-part2 cocktail4 ingredient1)
    (cocktail-part1 cocktail5 ingredient2)
    (cocktail-part2 cocktail5 ingredient1)
    (cocktail-part1 cocktail6 ingredient2)
    (cocktail-part2 cocktail6 ingredient3)
    (cocktail-part1 cocktail7 ingredient2)
    (cocktail-part2 cocktail7 ingredient1)
  )
  (:goal
    (and
      (contains shot1 cocktail6)
      (contains shot2 cocktail1)
      (contains shot3 cocktail3)
      (contains shot4 cocktail7)
      (contains shot5 cocktail5)
      (contains shot6 cocktail4)
      (contains shot7 cocktail2)
      (contains shot8 cocktail5)
    )
  )
)