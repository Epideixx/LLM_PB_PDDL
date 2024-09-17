(define (problem build_blocks)
  (:domain termes)
  (:objects 
    pos-0-0 pos-0-1 pos-0-2 
    pos-1-0 pos-1-1 pos-1-2 
    pos-2-0 pos-2-1 pos-2-2 
    pos-3-0 pos-3-1 pos-3-2 - position
    height-0 height-1 height-2 height-3 - numb
  )
  (:init
    ; Initial robot position
    (at pos-2-0)
    
    ; Depot location
    (IS-DEPOT pos-2-0)
    
    ; Initial heights (assuming all are initially 0)
    (height pos-0-0 height-0) 
    (height pos-0-1 height-0)
    (height pos-0-2 height-0)
    (height pos-1-0 height-0)
    (height pos-1-1 height-0)
    (height pos-1-2 height-0)
    (height pos-2-0 height-0)
    (height pos-2-1 height-0)
    (height pos-2-2 height-0)
    (height pos-3-0 height-0)
    (height pos-3-1 height-0)
    (height pos-3-2 height-0)
    
    ; SUCC predicates to define the successor relation
    (SUCC height-0 height-1)
    (SUCC height-1 height-2)
    (SUCC height-2 height-3)
  )
  (:goal
    (and
      ; Goal heights
      (height pos-2-1 height-3)
      (height pos-3-0 height-3)
      
      ; Ensure no unplaced blocks
      (not (has-block))
    )
  )
)
