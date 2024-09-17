### Rules in the Barman Domain

Given the domain and the problem, we can formulate a set of rules to guide how actions should be performed to achieve the goal of making 4 cocktails. These rules will be based on the preconditions and effects of the actions provided in the domain PDDL, as well as the logical flow of operations in a barman setting.

#### General Rules

1. **Empty Hands**: 
   - Before picking up any container (shaker or shot), the hand must be empty.
   - A hand can only hold one container at a time.

2. **Container States**:
   - A container (shaker or shot) must be clean before it can be used.
   - A container must be empty before it can be filled with a beverage or ingredient.

3. **Dispensing Ingredients**:
   - Ingredients can only be dispensed into empty and clean shot glasses.
   - The dispenser must be able to dispense the specific ingredient.

4. **Shaker Usage**:
   - A shaker must be empty and clean before pouring ingredients into it.
   - The shaker levels must be managed correctly according to the `next` predicate.
   - Shaking the shaker is required to mix ingredients into a cocktail.

5. **Cocktail Preparation**:
   - Each cocktail has specific ingredients that must be added to the shaker.
   - The shaker must be shaken to prepare the cocktail before emptying it into a shot glass.

#### Specific Rules Based on Actions

1. **Grasp Action**:
   - Preconditions: Container must be on the table, hand must be empty.
   - Effects: Container is no longer on the table, hand is no longer empty, hand is holding the container.

2. **Leave Action**:
   - Preconditions: Hand must be holding the container.
   - Effects: Hand is no longer holding the container, hand becomes empty, container is placed on the table.

3. **Fill Shot**:
   - Preconditions: Shot must be held, other hand must be empty, dispenser must dispense the ingredient, shot must be empty and clean.
   - Effects: Shot is no longer empty, contains the ingredient, shot is no longer clean, shot is marked as used.

4. **Refill Shot**:
   - Preconditions: Shot must be held, other hand must be empty, dispenser must dispense the ingredient, shot must be empty and previously used with the same ingredient.
   - Effects: Shot is no longer empty, contains the ingredient.

5. **Empty Shot**:
   - Preconditions: Shot must be held, shot must contain the beverage.
   - Effects: Shot no longer contains the beverage, shot becomes empty.

6. **Clean Shot**:
   - Preconditions: Shot must be held, other hand must be empty, shot must be empty and used with a beverage.
   - Effects: Shot is no longer used, becomes clean.

7. **Pour Shot to Clean Shaker**:
   - Preconditions: Shot must be held, shot must contain the ingredient, shaker must be empty and clean, correct shaker level, next level should exist.
   - Effects: Shot no longer contains the ingredient, shot becomes empty, shaker contains the ingredient, shaker is no longer empty or clean, shaker is unshaked, shaker level is updated.

8. **Pour Shot to Used Shaker**:
   - Preconditions: Shot must be held, shot must contain the ingredient, shaker must be unshaked, correct shaker level, next level should exist.
   - Effects: Shot no longer contains the ingredient, shot becomes empty, shaker contains the ingredient, shaker level is updated.

9. **Empty Shaker**:
   - Preconditions: Shaker must be held, shaker must contain the cocktail, shaker must be shaken, correct shaker levels.
   - Effects: Shaker is no longer shaken, shaker level is updated, shaker no longer contains the cocktail, shaker becomes empty.

10. **Clean Shaker**:
    - Preconditions: Shaker must be held, other hand must be empty, shaker must be empty.
    - Effects: Shaker becomes clean.

11. **Shake**:
    - Preconditions: Shaker must be held, other hand must be empty, shaker must contain the correct ingredients for the cocktail, shaker must be unshaked.
    - Effects: Shaker is no longer unshaked, ingredients are removed from the shaker, shaker contains the cocktail, shaker becomes shaken.

12. **Pour Shaker to Shot**:
    - Preconditions: Shaker must be held, shaker must be shaken, shot must be empty and clean, shaker must contain the cocktail, correct shaker levels.
    - Effects: Shot is no longer clean or empty, shot contains the cocktail, shaker level is updated.

### Summary
To achieve the goal of making 4 cocktails, these rules must be strictly followed. Each action has specific preconditions and effects that need to be considered to ensure the logical flow of operations. Managing container states, hand states, ingredient dispensing, and shaker usage are critical in this domain.