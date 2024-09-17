(define (domain monkey-banana)

(:requirements :strips :typing)

(:types chair banana agent - object
        position - location
        monkey - agent
)

(:predicates (very-high ?o - object)
        (high ?o - object)
        (on-ground ?o - object)
        (at ?o - object ?p - location)
        (pushable ?o - object)
        (climbable ?o - object)
        (graspable ?o - object)
        (on ?o - object ?p - location)    
        (adjacent ?p1 - location ?p2 - location)
        (can-jump ?o - object)
        (on ?a - agent ?o - object)
        (hold ?a - agent ?o - object) 
        (hand-free ?a - agent)
)

   (:action move
       :parameters  (?a - agent ?from ?to - location)
       :precondition (and  (at ?a ?from) (adjacent ?from ?to) (on-ground ?a))
       :effect (and  (not(at ?a ?from))
		     (at ?a ?to)))

   (:action climb_up
       :parameters (?a - agent ?o - object ?p - location)
       :precondition (and (at ?a ?p) (at ?o ?p) (climbable ?o) (on-ground ?a))
       :effect (and (not(on-ground ?a)) (on ?a ?o) (very-high ?a))
   )

   (:action climb_down
       :parameters (?a - agent ?o - object ?p - location)
       :precondition (and (at ?a ?p) (at ?o ?p) (climbable ?o) (on ?a ?o))
       :effect (and (on-ground ?a) (not(on ?a ?o)) (not(very-high ?a))))
   
   (:action jump_and_grab
       :parameters (?a - agent ?o - object ?p - location)
       :precondition (and (at ?a ?p) (at ?o ?p) (can-jump ?a) (on-ground ?a) (high ?o) (graspable ?o) (hand-free ?a))
       :effect (and (on-ground ?o) (hold ?a ?o) (not(hand-free ?a)) (not(high ?o))))

    (:action grab_very_high
        :parameters (?a - agent ?o - object ?p - location)
        :precondition (and (at ?o ?p) (at ?a ?p) (very-high ?o) (very-high ?a) (graspable ?o) (hand-free ?a))
        :effect (and (hold ?a ?o) (not(hand-free ?a)))
    )

    (:action grab_on_floor
        :parameters (?a - agent ?o - object ?p - location)
        :precondition (and (at ?a ?p) (at ?o ?p) (on-ground ?a) (on-ground ?o) (graspable ?o) (hand-free ?a))
        :effect (and (hold ?a ?o) (not(hand-free ?a)))
    )
    
   (:action push
       :parameters (?a - agent ?o - object ?from ?to - location)
       :precondition (and (at ?o ?from) (at ?a ?from) (pushable ?o) (adjacent ?from ?to) (on-ground ?a))
       :effect (and (at ?o ?to) (not(at ?o ?from)) (at ?a ?to) (not(at ?a ?from)))
   )
   

)