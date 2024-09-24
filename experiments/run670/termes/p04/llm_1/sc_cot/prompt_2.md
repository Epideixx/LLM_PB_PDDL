To determine the number of objects for each type, we need to identify and count the objects mentioned in the problem text. Let's categorize them based on the types defined in the domain PDDL.

### Types in the domain PDDL:
1. **position**
2. **numb**

### Extracting objects from the text:

1. **position**: The problem mentions positions on a grid with 4 rows and 3 columns.
   - Positions: `pos-0-0`, `pos-0-1`, `pos-0-2`, `pos-1-0`, `pos-1-1`, `pos-1-2`, `pos-2-0`, `pos-2-1`, `pos-2-2`, `pos-3-0`, `pos-3-1`, `pos-3-2`
   - Number of positions: 12

2. **numb**: The problem text mentions heights and the maximum height of blocks.
   - Heights mentioned: from 0 to 4 (assuming heights are integers ranging from 0 to 4)
   - Number of numb objects: 5 (0, 1, 2, 3, and 4)

Based on this extraction, we can summarize the number of objects for each type:

### Answer:
```json
{
  "position": 12,
  "numb": 5
}
```