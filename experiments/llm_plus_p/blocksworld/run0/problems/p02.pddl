
(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)
  (:objects b1 b2 b3)
  (:init (clear b1) (on b1 b3) (on b3 b2) (on-table b2) (arm-empty))
  (:goal (and (on b2 b3) (on b3 b1)))
)
