
(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)
  (:objects b1 b2 b3 b4 b5 b6)
  (:init (clear b5) (clear b4) (clear b6) (on b5 b2) (on b2 b3) (on b3 b1)
         (on-table b4) (on-table b6) (on-table b1) (arm-empty))
  (:goal (and (on b3 b5) (on b4 b3)))
)
