
(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)
  (:objects b1 b2 b3)
  (:init (on-table b1)
         (on b3 b1)
         (on b2 b3)
         (clear b2)
         (arm-empty))
  (:goal (and (on b2 b3)
              (on b3 b1))))
