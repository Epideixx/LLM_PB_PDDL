begin_version
3
end_version
begin_metric
0
end_metric
16
begin_variable
var0
-1
5
Atom at-robby(robot2, room1)
Atom at-robby(robot2, room2)
Atom at-robby(robot2, room3)
Atom at-robby(robot2, room4)
Atom at-robby(robot2, room5)
end_variable
begin_variable
var1
-1
5
Atom at-robby(robot1, room1)
Atom at-robby(robot1, room2)
Atom at-robby(robot1, room3)
Atom at-robby(robot1, room4)
Atom at-robby(robot1, room5)
end_variable
begin_variable
var2
-1
2
Atom at(ball1, room1)
NegatedAtom at(ball1, room1)
end_variable
begin_variable
var3
-1
2
Atom at(ball1, room2)
NegatedAtom at(ball1, room2)
end_variable
begin_variable
var4
-1
2
Atom at(ball1, room3)
NegatedAtom at(ball1, room3)
end_variable
begin_variable
var5
-1
3
Atom carry(robot1, ball1, left)
Atom carry(robot1, ball2, left)
Atom free(robot1, left)
end_variable
begin_variable
var6
-1
2
Atom at(ball1, room4)
NegatedAtom at(ball1, room4)
end_variable
begin_variable
var7
-1
2
Atom at(ball2, room1)
NegatedAtom at(ball2, room1)
end_variable
begin_variable
var8
-1
3
Atom carry(robot1, ball1, right)
Atom carry(robot1, ball2, right)
Atom free(robot1, right)
end_variable
begin_variable
var9
-1
2
Atom at(ball2, room2)
NegatedAtom at(ball2, room2)
end_variable
begin_variable
var10
-1
2
Atom at(ball2, room3)
NegatedAtom at(ball2, room3)
end_variable
begin_variable
var11
-1
3
Atom carry(robot2, ball1, left)
Atom carry(robot2, ball2, left)
Atom free(robot2, left)
end_variable
begin_variable
var12
-1
2
Atom at(ball2, room5)
NegatedAtom at(ball2, room5)
end_variable
begin_variable
var13
-1
3
Atom carry(robot2, ball1, right)
Atom carry(robot2, ball2, right)
Atom free(robot2, right)
end_variable
begin_variable
var14
-1
2
Atom at(ball1, room5)
NegatedAtom at(ball1, room5)
end_variable
begin_variable
var15
-1
2
Atom at(ball2, room4)
NegatedAtom at(ball2, room4)
end_variable
0
begin_state
1
0
0
1
1
2
1
0
2
1
1
2
1
2
1
1
end_state
begin_goal
2
14 0
15 0
end_goal
120
begin_operator
drop robot1 ball1 room1 left
1
1 0
2
0 2 -1 0
0 5 0 2
1
end_operator
begin_operator
drop robot1 ball1 room1 right
1
1 0
2
0 2 -1 0
0 8 0 2
1
end_operator
begin_operator
drop robot1 ball1 room2 left
1
1 1
2
0 3 -1 0
0 5 0 2
1
end_operator
begin_operator
drop robot1 ball1 room2 right
1
1 1
2
0 3 -1 0
0 8 0 2
1
end_operator
begin_operator
drop robot1 ball1 room3 left
1
1 2
2
0 4 -1 0
0 5 0 2
1
end_operator
begin_operator
drop robot1 ball1 room3 right
1
1 2
2
0 4 -1 0
0 8 0 2
1
end_operator
begin_operator
drop robot1 ball1 room4 left
1
1 3
2
0 6 -1 0
0 5 0 2
1
end_operator
begin_operator
drop robot1 ball1 room4 right
1
1 3
2
0 6 -1 0
0 8 0 2
1
end_operator
begin_operator
drop robot1 ball1 room5 left
1
1 4
2
0 14 -1 0
0 5 0 2
1
end_operator
begin_operator
drop robot1 ball1 room5 right
1
1 4
2
0 14 -1 0
0 8 0 2
1
end_operator
begin_operator
drop robot1 ball2 room1 left
1
1 0
2
0 7 -1 0
0 5 1 2
1
end_operator
begin_operator
drop robot1 ball2 room1 right
1
1 0
2
0 7 -1 0
0 8 1 2
1
end_operator
begin_operator
drop robot1 ball2 room2 left
1
1 1
2
0 9 -1 0
0 5 1 2
1
end_operator
begin_operator
drop robot1 ball2 room2 right
1
1 1
2
0 9 -1 0
0 8 1 2
1
end_operator
begin_operator
drop robot1 ball2 room3 left
1
1 2
2
0 10 -1 0
0 5 1 2
1
end_operator
begin_operator
drop robot1 ball2 room3 right
1
1 2
2
0 10 -1 0
0 8 1 2
1
end_operator
begin_operator
drop robot1 ball2 room4 left
1
1 3
2
0 15 -1 0
0 5 1 2
1
end_operator
begin_operator
drop robot1 ball2 room4 right
1
1 3
2
0 15 -1 0
0 8 1 2
1
end_operator
begin_operator
drop robot1 ball2 room5 left
1
1 4
2
0 12 -1 0
0 5 1 2
1
end_operator
begin_operator
drop robot1 ball2 room5 right
1
1 4
2
0 12 -1 0
0 8 1 2
1
end_operator
begin_operator
drop robot2 ball1 room1 left
1
0 0
2
0 2 -1 0
0 11 0 2
1
end_operator
begin_operator
drop robot2 ball1 room1 right
1
0 0
2
0 2 -1 0
0 13 0 2
1
end_operator
begin_operator
drop robot2 ball1 room2 left
1
0 1
2
0 3 -1 0
0 11 0 2
1
end_operator
begin_operator
drop robot2 ball1 room2 right
1
0 1
2
0 3 -1 0
0 13 0 2
1
end_operator
begin_operator
drop robot2 ball1 room3 left
1
0 2
2
0 4 -1 0
0 11 0 2
1
end_operator
begin_operator
drop robot2 ball1 room3 right
1
0 2
2
0 4 -1 0
0 13 0 2
1
end_operator
begin_operator
drop robot2 ball1 room4 left
1
0 3
2
0 6 -1 0
0 11 0 2
1
end_operator
begin_operator
drop robot2 ball1 room4 right
1
0 3
2
0 6 -1 0
0 13 0 2
1
end_operator
begin_operator
drop robot2 ball1 room5 left
1
0 4
2
0 14 -1 0
0 11 0 2
1
end_operator
begin_operator
drop robot2 ball1 room5 right
1
0 4
2
0 14 -1 0
0 13 0 2
1
end_operator
begin_operator
drop robot2 ball2 room1 left
1
0 0
2
0 7 -1 0
0 11 1 2
1
end_operator
begin_operator
drop robot2 ball2 room1 right
1
0 0
2
0 7 -1 0
0 13 1 2
1
end_operator
begin_operator
drop robot2 ball2 room2 left
1
0 1
2
0 9 -1 0
0 11 1 2
1
end_operator
begin_operator
drop robot2 ball2 room2 right
1
0 1
2
0 9 -1 0
0 13 1 2
1
end_operator
begin_operator
drop robot2 ball2 room3 left
1
0 2
2
0 10 -1 0
0 11 1 2
1
end_operator
begin_operator
drop robot2 ball2 room3 right
1
0 2
2
0 10 -1 0
0 13 1 2
1
end_operator
begin_operator
drop robot2 ball2 room4 left
1
0 3
2
0 15 -1 0
0 11 1 2
1
end_operator
begin_operator
drop robot2 ball2 room4 right
1
0 3
2
0 15 -1 0
0 13 1 2
1
end_operator
begin_operator
drop robot2 ball2 room5 left
1
0 4
2
0 12 -1 0
0 11 1 2
1
end_operator
begin_operator
drop robot2 ball2 room5 right
1
0 4
2
0 12 -1 0
0 13 1 2
1
end_operator
begin_operator
move robot1 room1 room2
0
1
0 1 0 1
1
end_operator
begin_operator
move robot1 room1 room3
0
1
0 1 0 2
1
end_operator
begin_operator
move robot1 room1 room4
0
1
0 1 0 3
1
end_operator
begin_operator
move robot1 room1 room5
0
1
0 1 0 4
1
end_operator
begin_operator
move robot1 room2 room1
0
1
0 1 1 0
1
end_operator
begin_operator
move robot1 room2 room3
0
1
0 1 1 2
1
end_operator
begin_operator
move robot1 room2 room4
0
1
0 1 1 3
1
end_operator
begin_operator
move robot1 room2 room5
0
1
0 1 1 4
1
end_operator
begin_operator
move robot1 room3 room1
0
1
0 1 2 0
1
end_operator
begin_operator
move robot1 room3 room2
0
1
0 1 2 1
1
end_operator
begin_operator
move robot1 room3 room4
0
1
0 1 2 3
1
end_operator
begin_operator
move robot1 room3 room5
0
1
0 1 2 4
1
end_operator
begin_operator
move robot1 room4 room1
0
1
0 1 3 0
1
end_operator
begin_operator
move robot1 room4 room2
0
1
0 1 3 1
1
end_operator
begin_operator
move robot1 room4 room3
0
1
0 1 3 2
1
end_operator
begin_operator
move robot1 room4 room5
0
1
0 1 3 4
1
end_operator
begin_operator
move robot1 room5 room1
0
1
0 1 4 0
1
end_operator
begin_operator
move robot1 room5 room2
0
1
0 1 4 1
1
end_operator
begin_operator
move robot1 room5 room3
0
1
0 1 4 2
1
end_operator
begin_operator
move robot1 room5 room4
0
1
0 1 4 3
1
end_operator
begin_operator
move robot2 room1 room2
0
1
0 0 0 1
1
end_operator
begin_operator
move robot2 room1 room3
0
1
0 0 0 2
1
end_operator
begin_operator
move robot2 room1 room4
0
1
0 0 0 3
1
end_operator
begin_operator
move robot2 room1 room5
0
1
0 0 0 4
1
end_operator
begin_operator
move robot2 room2 room1
0
1
0 0 1 0
1
end_operator
begin_operator
move robot2 room2 room3
0
1
0 0 1 2
1
end_operator
begin_operator
move robot2 room2 room4
0
1
0 0 1 3
1
end_operator
begin_operator
move robot2 room2 room5
0
1
0 0 1 4
1
end_operator
begin_operator
move robot2 room3 room1
0
1
0 0 2 0
1
end_operator
begin_operator
move robot2 room3 room2
0
1
0 0 2 1
1
end_operator
begin_operator
move robot2 room3 room4
0
1
0 0 2 3
1
end_operator
begin_operator
move robot2 room3 room5
0
1
0 0 2 4
1
end_operator
begin_operator
move robot2 room4 room1
0
1
0 0 3 0
1
end_operator
begin_operator
move robot2 room4 room2
0
1
0 0 3 1
1
end_operator
begin_operator
move robot2 room4 room3
0
1
0 0 3 2
1
end_operator
begin_operator
move robot2 room4 room5
0
1
0 0 3 4
1
end_operator
begin_operator
move robot2 room5 room1
0
1
0 0 4 0
1
end_operator
begin_operator
move robot2 room5 room2
0
1
0 0 4 1
1
end_operator
begin_operator
move robot2 room5 room3
0
1
0 0 4 2
1
end_operator
begin_operator
move robot2 room5 room4
0
1
0 0 4 3
1
end_operator
begin_operator
pick robot1 ball1 room1 left
1
1 0
2
0 2 0 1
0 5 2 0
1
end_operator
begin_operator
pick robot1 ball1 room1 right
1
1 0
2
0 2 0 1
0 8 2 0
1
end_operator
begin_operator
pick robot1 ball1 room2 left
1
1 1
2
0 3 0 1
0 5 2 0
1
end_operator
begin_operator
pick robot1 ball1 room2 right
1
1 1
2
0 3 0 1
0 8 2 0
1
end_operator
begin_operator
pick robot1 ball1 room3 left
1
1 2
2
0 4 0 1
0 5 2 0
1
end_operator
begin_operator
pick robot1 ball1 room3 right
1
1 2
2
0 4 0 1
0 8 2 0
1
end_operator
begin_operator
pick robot1 ball1 room4 left
1
1 3
2
0 6 0 1
0 5 2 0
1
end_operator
begin_operator
pick robot1 ball1 room4 right
1
1 3
2
0 6 0 1
0 8 2 0
1
end_operator
begin_operator
pick robot1 ball1 room5 left
1
1 4
2
0 14 0 1
0 5 2 0
1
end_operator
begin_operator
pick robot1 ball1 room5 right
1
1 4
2
0 14 0 1
0 8 2 0
1
end_operator
begin_operator
pick robot1 ball2 room1 left
1
1 0
2
0 7 0 1
0 5 2 1
1
end_operator
begin_operator
pick robot1 ball2 room1 right
1
1 0
2
0 7 0 1
0 8 2 1
1
end_operator
begin_operator
pick robot1 ball2 room2 left
1
1 1
2
0 9 0 1
0 5 2 1
1
end_operator
begin_operator
pick robot1 ball2 room2 right
1
1 1
2
0 9 0 1
0 8 2 1
1
end_operator
begin_operator
pick robot1 ball2 room3 left
1
1 2
2
0 10 0 1
0 5 2 1
1
end_operator
begin_operator
pick robot1 ball2 room3 right
1
1 2
2
0 10 0 1
0 8 2 1
1
end_operator
begin_operator
pick robot1 ball2 room4 left
1
1 3
2
0 15 0 1
0 5 2 1
1
end_operator
begin_operator
pick robot1 ball2 room4 right
1
1 3
2
0 15 0 1
0 8 2 1
1
end_operator
begin_operator
pick robot1 ball2 room5 left
1
1 4
2
0 12 0 1
0 5 2 1
1
end_operator
begin_operator
pick robot1 ball2 room5 right
1
1 4
2
0 12 0 1
0 8 2 1
1
end_operator
begin_operator
pick robot2 ball1 room1 left
1
0 0
2
0 2 0 1
0 11 2 0
1
end_operator
begin_operator
pick robot2 ball1 room1 right
1
0 0
2
0 2 0 1
0 13 2 0
1
end_operator
begin_operator
pick robot2 ball1 room2 left
1
0 1
2
0 3 0 1
0 11 2 0
1
end_operator
begin_operator
pick robot2 ball1 room2 right
1
0 1
2
0 3 0 1
0 13 2 0
1
end_operator
begin_operator
pick robot2 ball1 room3 left
1
0 2
2
0 4 0 1
0 11 2 0
1
end_operator
begin_operator
pick robot2 ball1 room3 right
1
0 2
2
0 4 0 1
0 13 2 0
1
end_operator
begin_operator
pick robot2 ball1 room4 left
1
0 3
2
0 6 0 1
0 11 2 0
1
end_operator
begin_operator
pick robot2 ball1 room4 right
1
0 3
2
0 6 0 1
0 13 2 0
1
end_operator
begin_operator
pick robot2 ball1 room5 left
1
0 4
2
0 14 0 1
0 11 2 0
1
end_operator
begin_operator
pick robot2 ball1 room5 right
1
0 4
2
0 14 0 1
0 13 2 0
1
end_operator
begin_operator
pick robot2 ball2 room1 left
1
0 0
2
0 7 0 1
0 11 2 1
1
end_operator
begin_operator
pick robot2 ball2 room1 right
1
0 0
2
0 7 0 1
0 13 2 1
1
end_operator
begin_operator
pick robot2 ball2 room2 left
1
0 1
2
0 9 0 1
0 11 2 1
1
end_operator
begin_operator
pick robot2 ball2 room2 right
1
0 1
2
0 9 0 1
0 13 2 1
1
end_operator
begin_operator
pick robot2 ball2 room3 left
1
0 2
2
0 10 0 1
0 11 2 1
1
end_operator
begin_operator
pick robot2 ball2 room3 right
1
0 2
2
0 10 0 1
0 13 2 1
1
end_operator
begin_operator
pick robot2 ball2 room4 left
1
0 3
2
0 15 0 1
0 11 2 1
1
end_operator
begin_operator
pick robot2 ball2 room4 right
1
0 3
2
0 15 0 1
0 13 2 1
1
end_operator
begin_operator
pick robot2 ball2 room5 left
1
0 4
2
0 12 0 1
0 11 2 1
1
end_operator
begin_operator
pick robot2 ball2 room5 right
1
0 4
2
0 12 0 1
0 13 2 1
1
end_operator
0
