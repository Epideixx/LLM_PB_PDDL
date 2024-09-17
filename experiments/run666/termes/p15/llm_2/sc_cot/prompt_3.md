Based on the provided problem text, let's extract the names of each object for the types described in the domain PDDL.

**Problem Text:**
```
The robot is on a grid with 4 rows and 3 columns. 
pos-0-0 pos-0-1 pos-0-2 
pos-1-0 pos-1-1 pos-1-2 
pos-2-0 pos-2-1 pos-2-2 
pos-3-0 pos-3-1 pos-3-2 
The robot is at pos-2-0. 
The depot for new blocks is at pos-2-0. 
The maximum height of blocks is 5. 
Your goal is to build blocks so that the height at pos-0-2 is 5, the height at pos-3-0 is 3, the height at pos-3-2 is 2. 
The heights at the other positions remain unchanged.
You cannot have an unplaced block at the end.
```

**Types from Domain PDDL:**
1. **numb**
2. **position**

**Extracted Names of Each Object:**

1. **position:**
   - The grid has 4 rows and 3 columns, which gives us the following 12 positions:
     - pos-0-0, pos-0-1, pos-0-2
     - pos-1-0, pos-1-1, pos-1-2
     - pos-2-0, pos-2-1, pos-2-2
     - pos-3-0, pos-3-1, pos-3-2

2. **numb:**
   - The maximum height of blocks is given as 5, which implies the following 6 numerical values representing heights:
     - 0, 1, 2, 3, 4, 5

**Answer:**
```json
{
  "position": ["pos-0-0", "pos-0-1", "pos-0-2", "pos-1-0", "pos-1-1", "pos-1-2", "pos-2-0", "pos-2-1", "pos-2-2", "pos-3-0", "pos-3-1", "pos-3-2"],
  "numb": ["0", "1", "2", "3", "4", "5"]
}
```

This represents the names of each object for the types based on the given problem description.