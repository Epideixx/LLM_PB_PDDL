(define (problem blocks-problem-1)
  (:domain blocksworld-4ops)

  (:objects
    b1 b2 b3 - block
  )

  (:init
    (clear b2)
    (on b2 b3)
    (on b3 b1)
    (on-table b1)
    (arm-empty)
  )

  (:goal
    (and
      (on b2 b3)
      (on b3 b1)
    )
  )
)
