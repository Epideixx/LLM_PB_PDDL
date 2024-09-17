
(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)
  (:objects b1 b2 b3 b4 b5)
  (:init
    (on-table b1)
    (on b2 b1)
    (on b4 b2)
    (on b3 b4)
    (on b5 b3)
    (clear b5)
    (arm-empty)
  )
  (:goal
    (and
      (on b1 b2)
      (on b3 b5)
      (on b4 b1)
    )
  )
)
