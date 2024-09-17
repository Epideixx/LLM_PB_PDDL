Based on the provided problem text, let's extract the number of objects for each type described in the domain PDDL.

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

**Extracted Objects for Each Type:**

1. **position:**
   - The grid has 4 rows and 3 columns, which gives us 12 positions.
   - Positions are: pos-0-0, pos-0-1, pos-0-2, pos-1-0, pos-1-1, pos-1-2, pos-2-0, pos-2-1, pos-2-2, pos-3-0, pos-3-1, pos-3-2.
   - So, there are 12 positions in total.

2. **numb:**
   - The maximum height of blocks is given as 5, which implies there are 6 possible height levels (0 through 5).
   - Therefore, there are 6 numerical values representing heights: 0, 1, 2, 3, 4, and 5.

**Answer:**
```json
{
  "position": 12,
  "numb": 6
}
```

This represents the number of objects for each type based on the given problem description.