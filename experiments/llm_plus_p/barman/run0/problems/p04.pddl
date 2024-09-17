(define (problem barman_problem)
  (:domain barman)
  (:objects left right - hand
            level1 level2 level3 - level
            ingredient1 ingredient2 ingredient3 - ingredient
            dispenser1 dispenser2 dispenser3 - dispenser
            shot1 shot2 shot3 shot4 - shot
            shaker1 - shaker
            cocktail1 cocktail2 cocktail3 - cocktail)
  (:init (handempty left) (handempty right)
         (ontable shot1) (ontable shot2) (ontable shot3) (ontable shot4)
         (ontable shaker1)
         (clean shot1) (clean shot2) (clean shot3) (clean shot4)
         (clean shaker1)
         (empty shot1) (empty shot2) (empty shot3) (empty shot4)
         (empty shaker1)
         (shaker-level shaker1 level1)
         (shaker-empty-level shaker1 level3)
         (next level1 level2) (next level2 level3)
         (dispenses dispenser1 ingredient1)
         (dispenses dispenser2 ingredient2)
         (dispenses dispenser3 ingredient3)
         (cocktail-part1 cocktail1 ingredient2)
         (cocktail-part2 cocktail1 ingredient1)
         (cocktail-part1 cocktail2 ingredient2)
         (cocktail-part2 cocktail2 ingredient3)
         (cocktail-part1 cocktail3 ingredient1)
         (cocktail-part2 cocktail3 ingredient2))
  (:goal (and (contains shot1 cocktail1)
              (contains shot2 cocktail3)
              (contains shot3 cocktail2))))