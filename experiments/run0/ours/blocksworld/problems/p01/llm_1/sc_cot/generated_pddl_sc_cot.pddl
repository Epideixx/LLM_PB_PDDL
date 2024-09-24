(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)

  (:objects
    b1 b2 b3 - block
  )

  (:init
    (on b2 b3)
    (on b3 b1)
    (on-table b1)
    (clear b2)
    (arm-empty)
  )

  (:goal
    (and
      (on b2 b3)
      (on b3 b1)
    )
  )
)
