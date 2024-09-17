In the context of the given domain and problem, we can derive a set of rules that will guide how actions are performed and how states are transitioned. Here are some general rules based on the predicates, actions, and objects described in the domain PDDL and the problem statement.

### General Rules:

1. **Object States:**
   - A container (shaker or shot) can be either clean or dirty.
   - A container (shaker or shot) can be either empty or contain a specific beverage.
   - A hand can be either holding a container or be empty.

2. **Actions and Preconditions:**
   - **Grasp**: A hand can only grasp a container if the container is on the table and the hand is empty.
   - **Leave**: A hand can only leave a container on the table if it is holding the container.
   - **Fill-Shot**: A shot glass can be filled with an ingredient from a dispenser if the shot glass is clean, empty, and being held by a hand, and the other hand is empty.
   - **Refill-Shot**: A shot glass can be refilled with an ingredient from a dispenser if it was previously used with the same ingredient and is empty.
   - **Empty-Shot**: A shot glass can be emptied if it is being held by a hand and contains a beverage.
   - **Clean-Shot**: A shot glass can be cleaned if it is dirty and empty, and one hand is holding the shot glass while the other hand is empty.
   - **Pour-Shot-to-Clean-Shaker**: A shot glass can pour its contents into a clean, empty shaker if the shaker is at a specific level and the levels are properly sequenced.
   - **Pour-Shot-to-Used-Shaker**: A shot glass can pour its contents into a used, unshaken shaker if the shaker is at a specific level and the levels are properly sequenced.
   - **Empty-Shaker**: A shaker can be emptied into a shot glass if it contains a beverage and is shaken.
   - **Clean-Shaker**: A shaker can be cleaned if it is empty and one hand is holding the shaker while the other hand is empty.
   - **Shake**: A shaker can be shaken to make a cocktail if it contains the required ingredients and is being held by a hand while the other hand is empty.
   - **Pour-Shaker-to-Shot**: A shaker can pour its contents into a shot glass if the shot glass is clean and empty and the shaker has been shaken.

3. **Logical Sequencing:**
   - Ingredients must be dispensed into shot glasses before they can be poured into a shaker.
   - Shakers must be shaken to mix ingredients before the cocktail can be poured into a shot glass.
   - Containers must be cleaned after use to be reused.
   - Each cocktail requires specific ingredients to be present in the shaker before it can be shaken.

4. **Handling Objects:**
   - A container must be on the table or held by a hand.
   - A hand cannot hold more than one container at a time.
   - A container must be empty before it can be cleaned.

5. **Goals:**
   - The goal is to make specific cocktails and have them contained in specific shot glasses.
   - The final state should ensure that each shot glass contains the correct cocktail.

### Example Rule Application:

- **Making a Cocktail:**
  1. Use the dispenser to fill a shot glass with the required ingredient (precondition: shot glass is clean and empty).
  2. Pour the shot glass into the shaker (precondition: shaker is clean and empty, levels must be sequenced).
  3. Repeat for all required ingredients.
  4. Shake the shaker to mix the ingredients (precondition: contains all required ingredients).
  5. Pour the mixed cocktail from the shaker into a shot glass (precondition: shot glass is clean and empty).

By following these rules, you ensure that actions are performed logically and in sequence, adhering to the constraints and conditions defined in the domain PDDL. This structured approach helps in achieving the goal state efficiently.