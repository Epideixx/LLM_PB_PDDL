(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)
  (:objects b1 b2 b3 b4 b5)  ;; List of blocks
  
  (:init 
    (clear b4)               ;; b4 is clear
    (on b4 b1)               ;; b4 is on top of b1
    (on b2 b3)               ;; b2 is on top of b3
    (on b3 b5)               ;; b3 is on top of b5
    (on b1 b2)               ;; b1 is on top of b2
    (on-table b5)            ;; b5 is on the table
    (arm-empty)              ;; The arm is empty
  )
  
  (:goal 
    (and 
      (on b1 b3)             ;; b1 should be on top of b3
      (on b3 b5)             ;; b3 should be on top of b5
    )
  )
)
