
(define (problem blocksworld_problem)
  (:domain blocksworld-4ops)
  (:objects b1 b2 b3 b4)
  (:init (clear b1) (clear b4) (on b1 b3) (on b3 b2) (on-table b2) (on-table b4) (arm-empty))
  (:goal (and (on b2 b1) (on b3 b4)))
)
