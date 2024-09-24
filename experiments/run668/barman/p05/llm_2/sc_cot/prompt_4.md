Given the domain and the problem, let's outline some rules and constraints that need to be followed. These rules will help us understand how to manipulate the objects and achieve the goals in this domain.

### Basic Rules

1. **Holding and Manipulation:**
   - A hand can only hold one container at a time.
   - A container can only be held by one hand at a time.
   - A hand needs to be empty to pick up a container.
   - Containers need to be placed back on the table if they are no longer being held.

2. **Container States:**
   - Containers can be clean or dirty.
   - Containers can be empty or contain a beverage.
   - Containers need to be cleaned before they can be reused.

3. **Levels and Shakers:**
   - Shakers have levels that indicate the amount or stage of the ingredients inside.
   - Shakers need to be empty and clean before being filled.
   - Shakers can only be shaken if they contain the correct ingredients for a cocktail.

4. **Dispensing and Mixing:**
   - Dispensers provide specific ingredients.
   - Ingredients need to be dispensed into containers before they can be mixed.
   - Mixing ingredients in a shaker produces a cocktail.

### Specific Rules and Constraints

1. **Grasping and Leaving:**
   - To pick up a container from the table, the hand must be empty.
   - To place a container back on the table, the hand must be holding it.

2. **Filling and Refilling Shots:**
   - Shots must be clean and empty before being filled with an ingredient.
   - Shots can be refilled with the same ingredient if they are empty but not clean.

3. **Emptying and Cleaning Shots:**
   - Shots can be emptied if they contain a beverage.
   - Shots need to be cleaned if they have been used.

4. **Pouring Ingredients:**
   - Ingredients can be poured from shots to shakers if the shaker is empty and clean.
   - Pouring ingredients changes the level of the shaker.

5. **Shaking Shakers:**
   - Shakers can only be shaken if they contain the correct ingredients for a specific cocktail.
   - Shaking a shaker will create a cocktail, which will then be contained within the shaker.

6. **Emptying and Cleaning Shakers:**
   - Shakers can be emptied to remove the cocktail.
   - Empty shakers can be cleaned.

7. **Cocktail Mixing:**
   - Each cocktail requires specific ingredients in a specific order.
   - A cocktail is produced by shaking the correct ingredients together.

### Goal Constraints

1. **Cocktail Preparation:**
   - Four specific cocktails need to be prepared.
   - Each cocktail must be placed in a specific shot glass.

2. **Object States for Goals:**
   - Shaker and shot glasses must start clean and empty.
   - Hands must start empty.
   - Ingredients must be dispensed as per the recipe for each cocktail.

### Example Rule Application

To illustrate, let's consider the process of making `cocktail1`:

1. **Grasping:**
   - Use `grasp` action to pick up an empty shot glass with a hand.
   
2. **Filling Shot:**
   - Use `fill-shot` action to fill the shot glass with the correct ingredient from the dispenser.

3. **Pouring to Shaker:**
   - Use `pour-shot-to-clean-shaker` action to pour the ingredient into the shaker.

4. **Shaking:**
   - After adding all required ingredients, use the `shake` action to mix the ingredients into `cocktail1`.

5. **Pouring Cocktail into Shot:**
   - Use `pour-shaker-to-shot` action to pour the prepared cocktail into the shot glass.

By following these rules and constraints, we can create a structured plan to achieve the goals defined in the problem description.