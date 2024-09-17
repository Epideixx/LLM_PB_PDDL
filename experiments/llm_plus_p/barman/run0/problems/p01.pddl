
(define (problem barman_problem)
  (:domain barman)
  (:objects shaker1 - shaker
            shot1 shot2 shot3 shot4 - shot
            dispenser1 dispenser2 dispenser3 - dispenser
            ingredient1 ingredient2 ingredient3 - ingredient
            cocktail1 cocktail2 cocktail3 - cocktail
            level1 level2 level3 - level
            left right - hand)
  (:init (ontable shaker1)
         (ontable shot1) (ontable shot2) (ontable shot3) (ontable shot4)
         (clean shaker1) (clean shot1) (clean shot2) (clean shot3) (clean shot4)
         (empty shaker1) (empty shot1) (empty shot2) (empty shot3) (empty shot4)
         (handempty left) (handempty right)
         (dispenses dispenser1 ingredient1)
         (dispenses dispenser2 ingredient2)
         (dispenses dispenser3 ingredient3)
         (cocktail-part1 cocktail1 ingredient1)
         (cocktail-part2 cocktail1 ingredient3)
         (cocktail-part1 cocktail2 ingredient2)
         (cocktail-part2 cocktail2 ingredient3)
         (cocktail-part1 cocktail3 ingredient1)
         (cocktail-part2 cocktail3 ingredient2)
         (shaker-level shaker1 level1)
         (next level1 level2)
         (next level2 level3)
         (shaker-empty-level shaker1 level1))
  (:goal (and (contains shot1 cocktail1)
              (contains shot2 cocktail3)
              (contains shot3 cocktail2))))
