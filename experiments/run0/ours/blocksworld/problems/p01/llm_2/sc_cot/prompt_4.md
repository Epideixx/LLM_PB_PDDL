Certainly! Here are some concise rules to write a problem PDDL in the blocks world domain:

### Rules for Writing Problem PDDL

1. **Define Problem and Domain**:
   - Begin with `(define (problem <problem_name>) (:domain blocksworld-4ops))`.
   - Replace `<problem_name>` with a meaningful name for the problem.

2. **Declare Objects**:
   - Use the `:objects` section to list all objects in the problem.
   - Ensure all blocks are listed and correctly named, e.g., `(b1 b2 b3 - block)`.

3. **Initial State**:
   - Use the `:init` section to specify the initial conditions.
   - Include all relevant predicates to describe the starting state.
     - For instance:
       ```pddl
       (clear b2)
       (on b3 b1)
       (on b2 b3)
       (on-table b1)
       (arm-empty)
       ```

4. **Goal State**:
   - Use the `:goal` section to specify the desired end state.
   - Include all relevant predicates to describe the goal.
     - For example:
       ```pddl
       (and
         (on b2 b3)
         (on b3 b1)
       )
       ```

5. **Predicate Consistency**:
   - Ensure that the predicates used in the `:init` and `:goal` sections are consistent with the domain predicates.
   - Use only predicates defined in the domain: `clear`, `on-table`, `arm-empty`, `holding`, `on`.

6. **Avoid Redundancy**:
   - Do not repeat predicates unnecessarily in the `:init` and `:goal` sections.

### Example Problem PDDL

Here is an example problem PDDL based on the text provided:

```pddl
(define (problem blocks-problem-1)
  (:domain blocksworld-4ops)

  (:objects
    b1 b2 b3 - block
  )

  (:init
    (clear b2)
    (on b3 b1)
    (on b2 b3)
    (on-table b1)
    (arm-empty)
  )

  (:goal
    (and
      (on b2 b3)
      (on b3 b1)
    )
  )
)
```

### Summary of Rules
1. **Define the problem and domain**.
2. **Declare all objects** in the problem.
3. **Specify the initial state** using the `:init` section with relevant predicates.
4. **Specify the goal state** using the `:goal` section with relevant predicates.
5. **Ensure predicate consistency** with the domain predicates.
6. **Avoid redundancy** in the initial and goal states.

Following these rules will help create a well-structured and concise problem PDDL for the blocks world domain.