Creating a problem PDDL involves following a set of structured rules to accurately describe the initial state and the goal state within the given domain. Here are the key rules to follow:

### Rules for Writing a Problem PDDL:

1. **Define the Problem:**
   - Start with the `(define (problem <problem_name>)` statement.
   - Specify the domain using `(:domain <domain_name>)`.

2. **Declare Objects:**
   - List all the objects using the `(:objects ...)` section.
   - Each object should be mentioned with its type. For example, `b1 b2 b3 - block`.

3. **Specify the Initial State:**
   - Use the `(:init ...)` section to describe the initial conditions.
   - Include all relevant predicates that describe the state of the world at the beginning.
     - For instance, `(on b3 b1)` indicates that block `b3` is on block `b1`.
     - `(on-table b1)` indicates that block `b1` is on the table.
     - `(clear b2)` indicates that block `b2` has no other block on top of it.
     - `(arm-empty)` indicates that the robot's arm is empty.

4. **Define the Goal State:**
   - Use the `(:goal ...)` section to describe the desired end state.
   - Include all relevant predicates that should be true for the goal to be achieved.
     - For instance, `(on b3 b1)` indicates that block `b3` should be on block `b1`.
     - `(on b2 b3)` indicates that block `b2` should be on block `b3`.

5. **Example Syntax:**
   - Ensure that the syntax is correct and follows the PDDL structure.
   - Make sure all parentheses are properly closed and nested.

### Example Problem PDDL:

Given the rules above, here is the problem PDDL for the provided Blocksworld scenario:

```lisp
(define (problem blocksworld-problem)
  (:domain blocksworld-4ops)
  
  ;; Declare Objects
  (:objects b1 b2 b3 - block)
  
  ;; Initial State
  (:init
    (on b3 b1)
    (on b2 b3)
    (on-table b1)
    (clear b2)
    (arm-empty)
  )
  
  ;; Goal State
  (:goal
    (and
      (on b3 b1)
      (on b2 b3)
    )
  )
)
```

By following these rules, you can create a well-structured problem PDDL that accurately represents the initial state and the goal state for the given domain.