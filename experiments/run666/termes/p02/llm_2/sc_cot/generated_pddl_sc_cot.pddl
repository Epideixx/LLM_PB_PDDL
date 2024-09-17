(define (problem build_blocks)
  (:domain termes)
  (:objects 
    pos-0-0 pos-0-1 pos-0-2 
    pos-1-0 pos-1-1 pos-1-2 
    pos-2-0 pos-2-1 pos-2-2 
    pos-3-0 pos-3-1 pos-3-2 - position
    h0 h1 h2 h3 - numb
  )
  (:init
    ; Initial robot position
    (at pos-2-0)
    
    ; Depot location
    (IS-DEPOT pos-2-0)
    
    ; Initial heights (assuming all are initially 0)
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
    
    ; SUCC predicates to define the successor relation
    (SUCC h0 h1)
    (SUCC h1 h2)
    (SUCC h2 h3)
    
    ; NEIGHBOR predicates to define neighboring positions
    (NEIGHBOR pos-0-0 pos-0-1)
    (NEIGHBOR pos-0-1 pos-0-0)
    (NEIGHBOR pos-0-1 pos-0-2)
    (NEIGHBOR pos-0-2 pos-0-1)
    
    (NEIGHBOR pos-1-0 pos-1-1)
    (NEIGHBOR pos-1-1 pos-1-0)
    (NEIGHBOR pos-1-1 pos-1-2)
    (NEIGHBOR pos-1-2 pos-1-1)
    
    (NEIGHBOR pos-2-0 pos-2-1)
    (NEIGHBOR pos-2-1 pos-2-0)
    (NEIGHBOR pos-2-1 pos-2-2)
    (NEIGHBOR pos-2-2 pos-2-1)
    
    (NEIGHBOR pos-3-0 pos-3-1)
    (NEIGHBOR pos-3-1 pos-3-0)
    (NEIGHBOR pos-3-1 pos-3-2)
    (NEIGHBOR pos-3-2 pos-3-1)
    
    (NEIGHBOR pos-0-0 pos-1-0)
    (NEIGHBOR pos-1-0 pos-0-0)
    
    (NEIGHBOR pos-0-1 pos-1-1)
    (NEIGHBOR pos-1-1 pos-0-1)
    
    (NEIGHBOR pos-0-2 pos-1-2)
    (NEIGHBOR pos-1-2 pos-0-2)
    
    (NEIGHBOR pos-1-0 pos-2-0)
    (NEIGHBOR pos-2-0 pos-1-0)
    
    (NEIGHBOR pos-1-1 pos-2-1)
    (NEIGHBOR pos-2-1 pos-1-1)
    
    (NEIGHBOR pos-1-2 pos-2-2)
    (NEIGHBOR pos-2-2 pos-1-2)
    
    (NEIGHBOR pos-2-0 pos-3-0)
    (NEIGHBOR pos-3-0 pos-2-0)
    
    (NEIGHBOR pos-2-1 pos-3-1)
    (NEIGHBOR pos-3-1 pos-2-1)
    
    (NEIGHBOR pos-2-2 pos-3-2)
    (NEIGHBOR pos-3-2 pos-2-2)
  )
  (:goal
    (and
      ; Goal heights
      (height pos-2-1 h3)
      (height pos-3-0 h3)
      
      ; Ensure no unplaced blocks
      (not (has-block))
    )
  )
)
