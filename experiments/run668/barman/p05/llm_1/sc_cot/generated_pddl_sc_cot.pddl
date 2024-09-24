(define (problem make_cocktails)
  (:domain barman)
  (:objects 
    shaker1 - shaker
    level1 level2 level3 - level
    shot1 shot2 shot3 shot4 shot5 - shot
    dispenser1 dispenser2 dispenser3 - dispenser
    ingredient1 ingredient2 ingredient3 - ingredient
    cocktail1 cocktail2 cocktail3 cocktail4 - cocktail
    left right - hand
  )
  
  (:init
    ;; Initial cleanliness and emptiness of containers
    (clean shaker1) (empty shaker1) (ontable shaker1)
    (clean shot1) (empty shot1) (ontable shot1)
    (clean shot2) (empty shot2) (ontable shot2)
    (clean shot3) (empty shot3) (ontable shot3)
    (clean shot4) (empty shot4) (ontable shot4)
    (clean shot5) (empty shot5) (ontable shot5)
    
    ;; Hands are empty
    (handempty left)
    (handempty right)

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
    
    ;; Levels
    (next level1 level2)
    (next level2 level3)
    (shaker-empty-level shaker1 level1)
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
