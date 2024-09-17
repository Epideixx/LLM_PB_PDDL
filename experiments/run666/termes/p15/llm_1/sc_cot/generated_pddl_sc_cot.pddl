(define (problem block_stacking) 
   (:domain termes)
   (:objects 
       pos-0-0 pos-0-1 pos-0-2 
       pos-1-0 pos-1-1 pos-1-2 
       pos-2-0 pos-2-1 pos-2-2 
       pos-3-0 pos-3-1 pos-3-2 - position
       h1 h2 h3 h4 h5 - numb
   )
   
   (:init 
       ;; Initial robot position
       (at pos-2-0)
       
       ;; Depot position
       (IS-DEPOT pos-2-0)
       
       ;; Initial heights at all positions
       (height pos-0-0 h1)
       (height pos-0-1 h1)
       (height pos-0-2 h0)
       (height pos-1-0 h1)
       (height pos-1-1 h1)
       (height pos-1-2 h1)
       (height pos-2-0 h1)
       (height pos-2-1 h1)
       (height pos-2-2 h1)
       (height pos-3-0 h1)
       (height pos-3-1 h1)
       (height pos-3-2 h1)

       ;; Successor relationships for heights
       (SUCC h1 h2)
       (SUCC h2 h3)
       (SUCC h3 h4)
       (SUCC h4 h5)

       ;; Neighbor relationships for positions
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
           (height pos-0-2 h5)
           (height pos-3-0 h3)
           (height pos-3-2 h2)
           (not (has-block))
       )
   )
)
