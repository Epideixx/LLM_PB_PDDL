(define (problem block-stacking)
  (:domain blockworld)

  (:objects 
    pos-1-0 pos-2-0 pos-3-2 - position
    block1 block2 block3 block4 block5 - block
    agent - agent
  )

  (:init 
    (at agent pos-1-0)
    (at block1 pos-1-0)
    (at block2 pos-1-0)
    (at block3 pos-1-0)
    (at block4 pos-1-0)
    (at block5 pos-1-0)
  )

  (:goal 
    (and 
      (height pos-2-0 3)
      (height pos-3-2 4)
      (forall (?b - block) (or (at ?b pos-2-0) (at ?b pos-3-2)))
    )
  )
)
