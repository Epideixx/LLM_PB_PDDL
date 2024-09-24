(define (problem block_building)
  (:domain termes)
  (:objects 
    pos-0-0 pos-0-1 pos-0-2
    pos-1-0 pos-1-1 pos-1-2
    pos-2-0 pos-2-1 pos-2-2
    pos-3-0 pos-3-1 pos-3-2 - position
    h0 h1 h2 h3 h4 - numb
  )

  (:init 
    ;; Initial robot position
    (at pos-1-0)

    ;; Depot location
    (IS-DEPOT pos-1-0)
    
    ;; Neighboring positions
    (NEIGHBOR pos-0-0 pos-0-1) (NEIGHBOR pos-0-1 pos-0-0)
    (NEIGHBOR pos-0-1 pos-0-2) (NEIGHBOR pos-0-2 pos-0-1)
    (NEIGHBOR pos-1-0 pos-1-1) (NEIGHBOR pos-1-1 pos-1-0)
    (NEIGHBOR pos-1-1 pos-1-2) (NEIGHBOR pos-1-2 pos-1-1)
    (NEIGHBOR pos-2-0 pos-2-1) (NEIGHBOR pos-2-1 pos-2-0)
    (NEIGHBOR pos-2-1 pos-2-2) (NEIGHBOR pos-2-2 pos-2-1)
    (NEIGHBOR pos-3-0 pos-3-1) (NEIGHBOR pos-3-1 pos-3-0)
    (NEIGHBOR pos-3-1 pos-3-2) (NEIGHBOR pos-3-2 pos-3-1)
    (NEIGHBOR pos-0-0 pos-1-0) (NEIGHBOR pos-1-0 pos-0-0)
    (NEIGHBOR pos-0-1 pos-1-1) (NEIGHBOR pos-1-1 pos-0-1)
    (NEIGHBOR pos-0-2 pos-1-2) (NEIGHBOR pos-1-2 pos-0-2)
    (NEIGHBOR pos-1-0 pos-2-0) (NEIGHBOR pos-2-0 pos-1-0)
    (NEIGHBOR pos-1-1 pos-2-1) (NEIGHBOR pos-2-1 pos-1-1)
    (NEIGHBOR pos-1-2 pos-2-2) (NEIGHBOR pos-2-2 pos-1-2)
    (NEIGHBOR pos-2-0 pos-3-0) (NEIGHBOR pos-3-0 pos-2-0)
    (NEIGHBOR pos-2-1 pos-3-1) (NEIGHBOR pos-3-1 pos-2-1)
    (NEIGHBOR pos-2-2 pos-3-2) (NEIGHBOR pos-3-2 pos-2-2)

    ;; Successor relationships for heights
    (SUCC h0 h1) 
    (SUCC h1 h2) 
    (SUCC h2 h3) 
    (SUCC h3 h4)
  )

  (:goal 
    (and 
      ;; Desired heights at specific positions
      (height pos-2-0 h3)
      (height pos-3-2 h4)

      ;; No unplaced block at the end
      (not (has-block))
    )
  )
)
