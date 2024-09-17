(define (problem termes_example)
   (:domain termes)
   (:objects 
       pos-0-0 pos-0-1 pos-0-2 
       pos-1-0 pos-1-1 pos-1-2 
       pos-2-0 pos-2-1 pos-2-2 
       pos-3-0 pos-3-1 pos-3-2 - position
       h0 h1 h2 h3 h4 - numb
   )
   (:init 
       ; Initial robot position
       (at pos-1-0)
       
       ; Initial heights of all positions (assuming initial height is 0)
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
       
       ; Depot location
       (IS-DEPOT pos-1-0)
       
       ; Successor relationships for heights
       (SUCC h0 h1)
       (SUCC h1 h2)
       (SUCC h2 h3)
       (SUCC h3 h4)
       
       ; Neighbor relationships (assuming a 4x3 grid)
       (NEIGHBOR pos-0-0 pos-0-1)
       (NEIGHBOR pos-0-1 pos-0-0)
       (NEIGHBOR pos-0-1 pos-0-2)
       (NEIGHBOR pos-0-2 pos-0-1)
       (NEIGHBOR pos-0-0 pos-1-0)
       (NEIGHBOR pos-1-0 pos-0-0)
       (NEIGHBOR pos-1-0 pos-1-1)
       (NEIGHBOR pos-1-1 pos-1-0)
       (NEIGHBOR pos-1-1 pos-1-2)
       (NEIGHBOR pos-1-2 pos-1-1)
       (NEIGHBOR pos-1-0 pos-2-0)
       (NEIGHBOR pos-2-0 pos-1-0)
       (NEIGHBOR pos-2-0 pos-2-1)
       (NEIGHBOR pos-2-1 pos-2-0)
       (NEIGHBOR pos-2-1 pos-2-2)
       (NEIGHBOR pos-2-2 pos-2-1)
       (NEIGHBOR pos-2-0 pos-3-0)
       (NEIGHBOR pos-3-0 pos-2-0)
       (NEIGHBOR pos-3-0 pos-3-1)
       (NEIGHBOR pos-3-1 pos-3-0)
       (NEIGHBOR pos-3-1 pos-3-2)
       (NEIGHBOR pos-3-2 pos-3-1)
   )
   (:goal 
       (and 
           ; Goal heights
           (height pos-2-0 h3)
           (height pos-3-2 h4)
           
           ; Heights at other positions remain unchanged (initially h0)
           (height pos-0-0 h0)
           (height pos-0-1 h0)
           (height pos-0-2 h0)
           (height pos-1-0 h0)
           (height pos-1-1 h0)
           (height pos-1-2 h0)
           (height pos-2-1 h0)
           (height pos-2-2 h0)
           (height pos-3-0 h0)
           (height pos-3-1 h0)
           
           ; The robot should not have any unplaced blocks
           (not (has-block))
       )
   )
)
