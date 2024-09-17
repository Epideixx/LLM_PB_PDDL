(define (problem termes_problem)
  (:domain termes)
  (:objects
    pos-0-0 pos-0-1 pos-0-2 pos-1-0 pos-1-1 pos-1-2
    pos-2-0 pos-2-1 pos-2-2 pos-3-0 pos-3-1 pos-3-2 - position
    h0 h1 h2 h3 - numb
  )
  (:init
    ; Initial robot location
    (at pos-2-0)
    
    ; Depot location
    (IS-DEPOT pos-2-0)

    ; Initial heights (assuming all positions start with height h0)
    (height pos-0-0 h0)
    (height pos-0-1 h0)
    (height pos-0-2 h0)
    (height pos-1-0 h0)
    (height pos-1-1 h0)
    (height pos-1-2 h0)
    (height pos-2-0 h0)
    (height pos-2-1 h0)
    (height pos-2-2 h0)
    (height pos-3-0 h0)
    (height pos-3-1 h0)
    (height pos-3-2 h0)

    ; Successor relationships for heights
    (SUCC h0 h1)
    (SUCC h1 h2)
    (SUCC h2 h3)
    
    ; Initial state: The robot does not have a block
    (not (has-block))

    ; Neighbor relationships for grid positions
    (NEIGHBOR pos-0-0 pos-0-1) (NEIGHBOR pos-0-1 pos-0-0)
    (NEIGHBOR pos-0-1 pos-0-2) (NEIGHBOR pos-0-2 pos-0-1)
    (NEIGHBOR pos-1-0 pos-1-1) (NEIGHBOR pos-1-1 pos-1-0)
    (NEIGHBOR pos-1-1 pos-1-2) (NEIGHBOR pos-1-2 pos-1-1)
    (NEIGHBOR pos-2-0 pos-2-1) (NEIGHBOR pos-2-1 pos-2-0)
    (NEIGHBOR pos-2-1 pos-2-2) (NEIGHBOR pos-2-2 pos-2-1)
    (NEIGHBOR pos-3-0 pos-3-1) (NEIGHBOR pos-3-1 pos-3-0)
    (NEIGHBOR pos-3-1 pos-3-2) (NEIGHBOR pos-3-2 pos-3-1)
    (NEIGHBOR pos-0-0 pos-1-0) (NEIGHBOR pos-1-0 pos-0-0)
    (NEIGHBOR pos-1-0 pos-2-0) (NEIGHBOR pos-2-0 pos-1-0)
    (NEIGHBOR pos-2-0 pos-3-0) (NEIGHBOR pos-3-0 pos-2-0)
    (NEIGHBOR pos-0-1 pos-1-1) (NEIGHBOR pos-1-1 pos-0-1)
    (NEIGHBOR pos-1-1 pos-2-1) (NEIGHBOR pos-2-1 pos-1-1)
    (NEIGHBOR pos-2-1 pos-3-1) (NEIGHBOR pos-3-1 pos-2-1)
    (NEIGHBOR pos-0-2 pos-1-2) (NEIGHBOR pos-1-2 pos-0-2)
    (NEIGHBOR pos-1-2 pos-2-2) (NEIGHBOR pos-2-2 pos-1-2)
    (NEIGHBOR pos-2-2 pos-3-2) (NEIGHBOR pos-3-2 pos-2-2)
  )
  (:goal
    (and
      (height pos-2-1 h3)
      (height pos-3-0 h3)
      (not (has-block))
    )
  )
)
