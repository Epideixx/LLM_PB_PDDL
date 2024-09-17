(define (problem grid_blocks)
   (:domain termes)
   (:objects
        pos-0-0 pos-0-1 pos-0-2
        pos-1-0 pos-1-1 pos-1-2
        pos-2-0 pos-2-1 pos-2-2
        pos-3-0 pos-3-1 pos-3-2 - position
        h0 h1 h2 h3 - numb
   )
   (:init
        ; Initial position of the robot
        (at pos-2-0)

        ; Depot location
        (IS-DEPOT pos-2-0)

        ; Initial heights of all positions
        (height pos-0-0 h0) (height pos-0-1 h0) (height pos-0-2 h0)
        (height pos-1-0 h0) (height pos-1-1 h0) (height pos-1-2 h0)
        (height pos-2-0 h0) (height pos-2-1 h0) (height pos-2-2 h0)
        (height pos-3-0 h0) (height pos-3-1 h0) (height pos-3-2 h0)

        ; Successor relationships for heights
        (SUCC h0 h1) (SUCC h1 h2) (SUCC h2 h3)

        ; Neighbor relationships
        (NEIGHBOR pos-0-0 pos-0-1) (NEIGHBOR pos-0-0 pos-1-0)
        (NEIGHBOR pos-0-1 pos-0-0) (NEIGHBOR pos-0-1 pos-0-2) (NEIGHBOR pos-0-1 pos-1-1)
        (NEIGHBOR pos-0-2 pos-0-1) (NEIGHBOR pos-0-2 pos-1-2)
        (NEIGHBOR pos-1-0 pos-0-0) (NEIGHBOR pos-1-0 pos-1-1) (NEIGHBOR pos-1-0 pos-2-0)
        (NEIGHBOR pos-1-1 pos-0-1) (NEIGHBOR pos-1-1 pos-1-0) (NEIGHBOR pos-1-1 pos-1-2) (NEIGHBOR pos-1-1 pos-2-1)
        (NEIGHBOR pos-1-2 pos-0-2) (NEIGHBOR pos-1-2 pos-1-1) (NEIGHBOR pos-1-2 pos-2-2)
        (NEIGHBOR pos-2-0 pos-1-0) (NEIGHBOR pos-2-0 pos-2-1) (NEIGHBOR pos-2-0 pos-3-0)
        (NEIGHBOR pos-2-1 pos-1-1) (NEIGHBOR pos-2-1 pos-2-0) (NEIGHBOR pos-2-1 pos-2-2) (NEIGHBOR pos-2-1 pos-3-1)
        (NEIGHBOR pos-2-2 pos-1-2) (NEIGHBOR pos-2-2 pos-2-1) (NEIGHBOR pos-2-2 pos-3-2)
        (NEIGHBOR pos-3-0 pos-2-0) (NEIGHBOR pos-3-0 pos-3-1)
        (NEIGHBOR pos-3-1 pos-2-1) (NEIGHBOR pos-3-1 pos-3-0) (NEIGHBOR pos-3-1 pos-3-2)
        (NEIGHBOR pos-3-2 pos-2-2) (NEIGHBOR pos-3-2 pos-3-1)

        ; Initial state of blocks (robot not holding any blocks)
        (not (has-block))
   )
   (:goal
        (and
            ; Goal heights at specified positions
            (height pos-2-1 h3)
            (height pos-3-0 h3)

            ; Ensure heights at other positions remain unchanged
            (height pos-0-0 h0) (height pos-0-1 h0) (height pos-0-2 h0)
            (height pos-1-0 h0) (height pos-1-1 h0) (height pos-1-2 h0)
            (height pos-2-0 h0) (height pos-2-2 h0)
            (height pos-3-1 h0) (height pos-3-2 h0)

            ; Ensure the robot does not have an unplaced block
            (not (has-block))
        )
   )
)
