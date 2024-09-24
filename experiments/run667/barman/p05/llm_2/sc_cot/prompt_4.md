Given the domain and the problem description, let's outline some rules and constraints that should be followed to fit the context of the "barman" domain. These rules will guide the actions and state transitions for creating cocktails using the provided objects.

### General Rules

1. **Hand Constraints:**
   - A hand can only hold one container (shot glass or shaker) at a time.
   - Both hands can be empty, but neither hand can hold more than one object.

2. **Container Constraints:**
   - Containers (shaker, shot glasses) must be clean before they can be used to make or contain a beverage.
   - Containers must be empty before they can be filled with a new beverage.
   - Each container (shaker, shot glass) can hold only one type of beverage at a time.

3. **Dispensing Rules:**
   - Dispensers can dispense only specific ingredients.
   - Ingredients can be dispensed into a shot glass only if the shot glass is held by a hand and is empty and clean.

4. **Shaker Rules:**
   - A shaker must be filled with the correct ingredients for a specific cocktail.
   - A shaker must be shaken to mix the ingredients before pouring the contents into a shot glass.
   - Shakers must be empty and clean before they can be used again.

5. **Cocktail Rules:**
   - Each cocktail requires two specific ingredients.
   - The correct sequence of actions must be followed to create and pour a cocktail into a shot glass.
   - Each cocktail must be poured into an empty and clean shot glass.

### Specific Action Rules

1. **Grasp Action:**
   - Preconditions: Container must be on the table, hand must be empty.
   - Effects: Hand holds the container, container is not on the table, hand is not empty.

2. **Leave Action:**
   - Preconditions: Hand must be holding a container.
   - Effects: Container is placed on the table, hand is empty.

3. **Fill-Shot Action:**
   - Preconditions: Shot glass must be held by a hand, other hand must be empty, shot glass must be empty and clean, the dispenser must dispense the required ingredient.
   - Effects: Shot glass is not empty, contains the ingredient, is not clean, and is marked as used.

4. **Refill-Shot Action:**
   - Preconditions: Shot glass must be held by a hand, other hand must be empty, shot glass must be empty, the dispenser must dispense the required ingredient, shot glass must have been used with the same ingredient previously.
   - Effects: Shot glass is not empty, contains the ingredient.

5. **Empty-Shot Action:**
   - Preconditions: Hand must be holding a shot glass, shot glass must contain a beverage.
   - Effects: Shot glass is empty, does not contain the beverage.

6. **Clean-Shot Action:**
   - Preconditions: Shot glass must be held by a hand, other hand must be empty, shot glass must be empty, shot glass must have been used with a beverage.
   - Effects: Shot glass is clean, not used with the beverage.

7. **Pour-Shot-to-Clean-Shaker Action:**
   - Preconditions: Shot glass must be held by a hand, contains an ingredient, shaker must be empty and clean, shaker must be at a specific level, there must be a next level.
   - Effects: Shot glass is empty, does not contain the ingredient, shaker contains the ingredient, shaker is not empty, not clean, is unshaked, and moves to the next level.

8. **Pour-Shot-to-Used-Shaker Action:**
   - Preconditions: Shot glass must be held by a hand, contains an ingredient, shaker must be unshaked, shaker must be at a specific level, there must be a next level.
   - Effects: Shot glass is empty, does not contain the ingredient, shaker contains the ingredient, shaker is at the next level.

9. **Empty-Shaker Action:**
   - Preconditions: Shaker must be held by a hand, contains a cocktail, is shaked, shaker must be at a specific level, shaker must have an empty level.
   - Effects: Shaker does not contain the cocktail, shaker is empty, not shaked, and moves to the empty level.

10. **Clean-Shaker Action:**
    - Preconditions: Shaker must be held by a hand, other hand must be empty, shaker must be empty.
    - Effects: Shaker is clean.

11. **Shake Action:**
    - Preconditions: Shaker must be held by a hand, other hand must be empty, contains two specific ingredients, must be unshaked.
    - Effects: Shaker is shaked, does not contain the ingredients, contains the cocktail.

12. **Pour-Shaker-to-Shot Action:**
    - Preconditions: Shaker must be held by a hand, is shaked, contains a cocktail, shot glass must be empty and clean, shaker must be at a specific level, there must be a next level.
    - Effects: Shot glass contains the cocktail, is not empty, not clean, shaker is at the next level.

### Example Action Sequence

1. Grasp the shaker with the left hand.
2. Grasp a shot glass with the right hand.
3. Fill the shot glass with an ingredient from a dispenser.
4. Pour the ingredient from the shot glass into the shaker.
5. Repeat until all required ingredients are in the shaker.
6. Shake the shaker.
7. Pour the shaker contents into a clean shot glass.

By following these rules, you can ensure that the actions taken in the domain are logical, feasible, and correctly lead to the goal of making the required cocktails.