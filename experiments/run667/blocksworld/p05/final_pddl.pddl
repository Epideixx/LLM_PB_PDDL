(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)
  (:objects b1 b2 b3 b4 b5 - block)
  
  (:init
    (on b4 b1)
    (on b1 b2)
    (on b2 b3)
    (on b3 b5)
    (on-table b5)
    (clear b4)
    (arm-empty)
  )
  
  (:goal
    (and
      (on b1 b3)
      (on b3 b5)
    )
  )
)