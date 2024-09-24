(define (problem blocksworld-problem)
    (:domain blocksworld-4ops)
    (:objects b1 b2 b3 b4 b5)  ;; Define the blocks

    (:init 
        ;; Initial positions of the blocks
        (on b4 b1)
        (on b2 b3)
        (on b3 b5)
        (on b1 b2)
        (on-table b5)

        ;; Clear status
        (clear b4)

        ;; Arm status
        (arm-empty)
    )

    (:goal 
        (and
            ;; Goal positions of the blocks
            (on b1 b3)
            (on b3 b5)
        )
    )
)
