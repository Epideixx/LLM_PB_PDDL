(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)
  (:objects b1 b2 b3 b4 b5 b6)
  (:init (clear b6) (on b6 b4) (on b4 b5) (on b5 b1) (on b1 b3) (on b3 b2) (on-table b2) (arm-empty))
  (:goal (and (on b1 b6) (on b3 b5) (on b6 b2)))
)