
(define (problem blocksworld_problem)
  (:domain blocksworld-4ops)
  (:objects b1 b2 b3 b4 b5 b6 b7)
  (:init (on b6 b3) (on b2 b5) (on b4 b7) (on b7 b1)
         (on-table b3) (on-table b1) (on-table b5)
         (clear b6) (clear b2) (clear b4) (arm-empty))
  (:goal (and (on b1 b7) (on b2 b5) (on b3 b2) (on b4 b1)
              (on b5 b6) (on b7 b3))))
