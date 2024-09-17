(define (problem termes_problem)
  (:domain termes)
  (:objects
    pos-0-0 pos-0-1 pos-0-2
    pos-1-0 pos-1-1 pos-1-2
    pos-2-0 pos-2-1 pos-2-2
    pos-3-0 pos-3-1 pos-3-2 - position
    h1 h2 h3 - numb
  )
  
  (:init
    ;; Initial robot position
    (at pos-2-0)
    
    ;; Initial heights (assuming all heights are initially 0)
    (height pos-0-0 h1)
    (height pos-0-1 h1)
    (height pos-0-2 h1)
    (height pos-1-0 h1)
    (height pos-1-1 h1)
    (height pos-1-2 h1)
    (height pos-2-0 h1)
    (height pos-2-1 h1)
    (height pos-2-2 h1)
    (height pos-3-0 h1)
    (height pos-3-1 h1)
    (height pos-3-2 h1)
    
    ;; Define the depot position
    (IS-DEPOT pos-2-0)
    
    ;; Define successor relationships
    (SUCC h1 h2)
    (SUCC h2 h3)
    
    ;; Define neighbor relationships (assuming a 4x3 grid)
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
    ;; Vertical neighbors
    (NEIGHBOR pos-0-0 pos-1-0)
    (NEIGHBOR pos-1-0 pos-0-0)
    (NEIGHBOR pos-1-0 pos-2-0)
    (NEIGHBOR pos-2-0 pos-1-0)
    (NEIGHBOR pos-2-0 pos-3-0)
    (NEIGHBOR pos-3-0 pos-2-0)
    (NEIGHBOR pos-0-1 pos-1-1)
    (NEIGHBOR pos-1-1 pos-0-1)
    (NEIGHBOR pos-1-1 pos-2-1)
    (NEIGHBOR pos-2-1 pos-1-1)
    (NEIGHBOR pos-2-1 pos-3-1)
    (NEIGHBOR pos-3-1 pos-2-1)
    (NEIGHBOR pos-0-2 pos-1-2)
    (NEIGHBOR pos-1-2 pos-0-2)
    (NEIGHBOR pos-1-2 pos-2-2)
    (NEIGHBOR pos-2-2 pos-1-2)
    (NEIGHBOR pos-2-2 pos-3-2)
    (NEIGHBOR pos-3-2 pos-2-2)
  )
  
  (:goal
    (and
      ;; Desired heights
      (height pos-2-1 h3)
      (height pos-3-0 h3)
      
      ;; Heights at other positions remain unchanged (h1)
      (height pos-0-0 h1)
      (height pos-0-1 h1)
      (height pos-0-2 h1)
      (height pos-1-0 h1)
      (height pos-1-1 h1)
      (height pos-1-2 h1)
      (height pos-2-0 h1)
      (height pos-2-2 h1)
      (height pos-3-1 h1)
      (height pos-3-2 h1)
      
      ;; No unplaced blocks
      (not (has-block))
    )
  )
)