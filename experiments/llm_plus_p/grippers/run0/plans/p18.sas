begin_version
3
end_version
begin_metric
0
end_metric
30
begin_variable
var0
-1
3
Atom at-robby(robot4, room1)
Atom at-robby(robot4, room2)
Atom at-robby(robot4, room3)
end_variable
begin_variable
var1
-1
3
Atom at-robby(robot3, room1)
Atom at-robby(robot3, room2)
Atom at-robby(robot3, room3)
end_variable
begin_variable
var2
-1
3
Atom at-robby(robot2, room1)
Atom at-robby(robot2, room2)
Atom at-robby(robot2, room3)
end_variable
begin_variable
var3
-1
3
Atom at-robby(robot1, room1)
Atom at-robby(robot1, room2)
Atom at-robby(robot1, room3)
end_variable
begin_variable
var4
-1
2
Atom at(ball1, room2)
NegatedAtom at(ball1, room2)
end_variable
begin_variable
var5
-1
2
Atom at(ball1, room3)
NegatedAtom at(ball1, room3)
end_variable
begin_variable
var6
-1
2
Atom at(ball2, room2)
NegatedAtom at(ball2, room2)
end_variable
begin_variable
var7
-1
7
Atom carry(robot1, ball1, left)
Atom carry(robot1, ball2, left)
Atom carry(robot1, ball3, left)
Atom carry(robot1, ball4, left)
Atom carry(robot1, ball5, left)
Atom carry(robot1, ball6, left)
Atom free(robot1, left)
end_variable
begin_variable
var8
-1
2
Atom at(ball2, room3)
NegatedAtom at(ball2, room3)
end_variable
begin_variable
var9
-1
2
Atom at(ball3, room1)
NegatedAtom at(ball3, room1)
end_variable
begin_variable
var10
-1
7
Atom carry(robot1, ball1, right)
Atom carry(robot1, ball2, right)
Atom carry(robot1, ball3, right)
Atom carry(robot1, ball4, right)
Atom carry(robot1, ball5, right)
Atom carry(robot1, ball6, right)
Atom free(robot1, right)
end_variable
begin_variable
var11
-1
2
Atom at(ball3, room3)
NegatedAtom at(ball3, room3)
end_variable
begin_variable
var12
-1
2
Atom at(ball4, room1)
NegatedAtom at(ball4, room1)
end_variable
begin_variable
var13
-1
7
Atom carry(robot2, ball1, left)
Atom carry(robot2, ball2, left)
Atom carry(robot2, ball3, left)
Atom carry(robot2, ball4, left)
Atom carry(robot2, ball5, left)
Atom carry(robot2, ball6, left)
Atom free(robot2, left)
end_variable
begin_variable
var14
-1
2
Atom at(ball4, room2)
NegatedAtom at(ball4, room2)
end_variable
begin_variable
var15
-1
2
Atom at(ball5, room1)
NegatedAtom at(ball5, room1)
end_variable
begin_variable
var16
-1
7
Atom carry(robot2, ball1, right)
Atom carry(robot2, ball2, right)
Atom carry(robot2, ball3, right)
Atom carry(robot2, ball4, right)
Atom carry(robot2, ball5, right)
Atom carry(robot2, ball6, right)
Atom free(robot2, right)
end_variable
begin_variable
var17
-1
2
Atom at(ball5, room2)
NegatedAtom at(ball5, room2)
end_variable
begin_variable
var18
-1
2
Atom at(ball6, room1)
NegatedAtom at(ball6, room1)
end_variable
begin_variable
var19
-1
7
Atom carry(robot3, ball1, left)
Atom carry(robot3, ball2, left)
Atom carry(robot3, ball3, left)
Atom carry(robot3, ball4, left)
Atom carry(robot3, ball5, left)
Atom carry(robot3, ball6, left)
Atom free(robot3, left)
end_variable
begin_variable
var20
-1
2
Atom at(ball6, room2)
NegatedAtom at(ball6, room2)
end_variable
begin_variable
var21
-1
7
Atom carry(robot3, ball1, right)
Atom carry(robot3, ball2, right)
Atom carry(robot3, ball3, right)
Atom carry(robot3, ball4, right)
Atom carry(robot3, ball5, right)
Atom carry(robot3, ball6, right)
Atom free(robot3, right)
end_variable
begin_variable
var22
-1
7
Atom carry(robot4, ball1, left)
Atom carry(robot4, ball2, left)
Atom carry(robot4, ball3, left)
Atom carry(robot4, ball4, left)
Atom carry(robot4, ball5, left)
Atom carry(robot4, ball6, left)
Atom free(robot4, left)
end_variable
begin_variable
var23
-1
7
Atom carry(robot4, ball1, right)
Atom carry(robot4, ball2, right)
Atom carry(robot4, ball3, right)
Atom carry(robot4, ball4, right)
Atom carry(robot4, ball5, right)
Atom carry(robot4, ball6, right)
Atom free(robot4, right)
end_variable
begin_variable
var24
-1
2
Atom at(ball1, room1)
NegatedAtom at(ball1, room1)
end_variable
begin_variable
var25
-1
2
Atom at(ball2, room1)
NegatedAtom at(ball2, room1)
end_variable
begin_variable
var26
-1
2
Atom at(ball3, room2)
NegatedAtom at(ball3, room2)
end_variable
begin_variable
var27
-1
2
Atom at(ball4, room3)
NegatedAtom at(ball4, room3)
end_variable
begin_variable
var28
-1
2
Atom at(ball5, room3)
NegatedAtom at(ball5, room3)
end_variable
begin_variable
var29
-1
2
Atom at(ball6, room3)
NegatedAtom at(ball6, room3)
end_variable
0
begin_state
0
2
2
2
0
1
0
6
1
0
6
1
1
6
1
1
6
1
1
6
1
6
6
6
1
1
1
0
0
0
end_state
begin_goal
6
24 0
25 0
26 0
27 0
28 0
29 0
end_goal
312
begin_operator
drop robot1 ball1 room1 left
1
3 0
2
0 24 -1 0
0 7 0 6
1
end_operator
begin_operator
drop robot1 ball1 room1 right
1
3 0
2
0 24 -1 0
0 10 0 6
1
end_operator
begin_operator
drop robot1 ball1 room2 left
1
3 1
2
0 4 -1 0
0 7 0 6
1
end_operator
begin_operator
drop robot1 ball1 room2 right
1
3 1
2
0 4 -1 0
0 10 0 6
1
end_operator
begin_operator
drop robot1 ball1 room3 left
1
3 2
2
0 5 -1 0
0 7 0 6
1
end_operator
begin_operator
drop robot1 ball1 room3 right
1
3 2
2
0 5 -1 0
0 10 0 6
1
end_operator
begin_operator
drop robot1 ball2 room1 left
1
3 0
2
0 25 -1 0
0 7 1 6
1
end_operator
begin_operator
drop robot1 ball2 room1 right
1
3 0
2
0 25 -1 0
0 10 1 6
1
end_operator
begin_operator
drop robot1 ball2 room2 left
1
3 1
2
0 6 -1 0
0 7 1 6
1
end_operator
begin_operator
drop robot1 ball2 room2 right
1
3 1
2
0 6 -1 0
0 10 1 6
1
end_operator
begin_operator
drop robot1 ball2 room3 left
1
3 2
2
0 8 -1 0
0 7 1 6
1
end_operator
begin_operator
drop robot1 ball2 room3 right
1
3 2
2
0 8 -1 0
0 10 1 6
1
end_operator
begin_operator
drop robot1 ball3 room1 left
1
3 0
2
0 9 -1 0
0 7 2 6
1
end_operator
begin_operator
drop robot1 ball3 room1 right
1
3 0
2
0 9 -1 0
0 10 2 6
1
end_operator
begin_operator
drop robot1 ball3 room2 left
1
3 1
2
0 26 -1 0
0 7 2 6
1
end_operator
begin_operator
drop robot1 ball3 room2 right
1
3 1
2
0 26 -1 0
0 10 2 6
1
end_operator
begin_operator
drop robot1 ball3 room3 left
1
3 2
2
0 11 -1 0
0 7 2 6
1
end_operator
begin_operator
drop robot1 ball3 room3 right
1
3 2
2
0 11 -1 0
0 10 2 6
1
end_operator
begin_operator
drop robot1 ball4 room1 left
1
3 0
2
0 12 -1 0
0 7 3 6
1
end_operator
begin_operator
drop robot1 ball4 room1 right
1
3 0
2
0 12 -1 0
0 10 3 6
1
end_operator
begin_operator
drop robot1 ball4 room2 left
1
3 1
2
0 14 -1 0
0 7 3 6
1
end_operator
begin_operator
drop robot1 ball4 room2 right
1
3 1
2
0 14 -1 0
0 10 3 6
1
end_operator
begin_operator
drop robot1 ball4 room3 left
1
3 2
2
0 27 -1 0
0 7 3 6
1
end_operator
begin_operator
drop robot1 ball4 room3 right
1
3 2
2
0 27 -1 0
0 10 3 6
1
end_operator
begin_operator
drop robot1 ball5 room1 left
1
3 0
2
0 15 -1 0
0 7 4 6
1
end_operator
begin_operator
drop robot1 ball5 room1 right
1
3 0
2
0 15 -1 0
0 10 4 6
1
end_operator
begin_operator
drop robot1 ball5 room2 left
1
3 1
2
0 17 -1 0
0 7 4 6
1
end_operator
begin_operator
drop robot1 ball5 room2 right
1
3 1
2
0 17 -1 0
0 10 4 6
1
end_operator
begin_operator
drop robot1 ball5 room3 left
1
3 2
2
0 28 -1 0
0 7 4 6
1
end_operator
begin_operator
drop robot1 ball5 room3 right
1
3 2
2
0 28 -1 0
0 10 4 6
1
end_operator
begin_operator
drop robot1 ball6 room1 left
1
3 0
2
0 18 -1 0
0 7 5 6
1
end_operator
begin_operator
drop robot1 ball6 room1 right
1
3 0
2
0 18 -1 0
0 10 5 6
1
end_operator
begin_operator
drop robot1 ball6 room2 left
1
3 1
2
0 20 -1 0
0 7 5 6
1
end_operator
begin_operator
drop robot1 ball6 room2 right
1
3 1
2
0 20 -1 0
0 10 5 6
1
end_operator
begin_operator
drop robot1 ball6 room3 left
1
3 2
2
0 29 -1 0
0 7 5 6
1
end_operator
begin_operator
drop robot1 ball6 room3 right
1
3 2
2
0 29 -1 0
0 10 5 6
1
end_operator
begin_operator
drop robot2 ball1 room1 left
1
2 0
2
0 24 -1 0
0 13 0 6
1
end_operator
begin_operator
drop robot2 ball1 room1 right
1
2 0
2
0 24 -1 0
0 16 0 6
1
end_operator
begin_operator
drop robot2 ball1 room2 left
1
2 1
2
0 4 -1 0
0 13 0 6
1
end_operator
begin_operator
drop robot2 ball1 room2 right
1
2 1
2
0 4 -1 0
0 16 0 6
1
end_operator
begin_operator
drop robot2 ball1 room3 left
1
2 2
2
0 5 -1 0
0 13 0 6
1
end_operator
begin_operator
drop robot2 ball1 room3 right
1
2 2
2
0 5 -1 0
0 16 0 6
1
end_operator
begin_operator
drop robot2 ball2 room1 left
1
2 0
2
0 25 -1 0
0 13 1 6
1
end_operator
begin_operator
drop robot2 ball2 room1 right
1
2 0
2
0 25 -1 0
0 16 1 6
1
end_operator
begin_operator
drop robot2 ball2 room2 left
1
2 1
2
0 6 -1 0
0 13 1 6
1
end_operator
begin_operator
drop robot2 ball2 room2 right
1
2 1
2
0 6 -1 0
0 16 1 6
1
end_operator
begin_operator
drop robot2 ball2 room3 left
1
2 2
2
0 8 -1 0
0 13 1 6
1
end_operator
begin_operator
drop robot2 ball2 room3 right
1
2 2
2
0 8 -1 0
0 16 1 6
1
end_operator
begin_operator
drop robot2 ball3 room1 left
1
2 0
2
0 9 -1 0
0 13 2 6
1
end_operator
begin_operator
drop robot2 ball3 room1 right
1
2 0
2
0 9 -1 0
0 16 2 6
1
end_operator
begin_operator
drop robot2 ball3 room2 left
1
2 1
2
0 26 -1 0
0 13 2 6
1
end_operator
begin_operator
drop robot2 ball3 room2 right
1
2 1
2
0 26 -1 0
0 16 2 6
1
end_operator
begin_operator
drop robot2 ball3 room3 left
1
2 2
2
0 11 -1 0
0 13 2 6
1
end_operator
begin_operator
drop robot2 ball3 room3 right
1
2 2
2
0 11 -1 0
0 16 2 6
1
end_operator
begin_operator
drop robot2 ball4 room1 left
1
2 0
2
0 12 -1 0
0 13 3 6
1
end_operator
begin_operator
drop robot2 ball4 room1 right
1
2 0
2
0 12 -1 0
0 16 3 6
1
end_operator
begin_operator
drop robot2 ball4 room2 left
1
2 1
2
0 14 -1 0
0 13 3 6
1
end_operator
begin_operator
drop robot2 ball4 room2 right
1
2 1
2
0 14 -1 0
0 16 3 6
1
end_operator
begin_operator
drop robot2 ball4 room3 left
1
2 2
2
0 27 -1 0
0 13 3 6
1
end_operator
begin_operator
drop robot2 ball4 room3 right
1
2 2
2
0 27 -1 0
0 16 3 6
1
end_operator
begin_operator
drop robot2 ball5 room1 left
1
2 0
2
0 15 -1 0
0 13 4 6
1
end_operator
begin_operator
drop robot2 ball5 room1 right
1
2 0
2
0 15 -1 0
0 16 4 6
1
end_operator
begin_operator
drop robot2 ball5 room2 left
1
2 1
2
0 17 -1 0
0 13 4 6
1
end_operator
begin_operator
drop robot2 ball5 room2 right
1
2 1
2
0 17 -1 0
0 16 4 6
1
end_operator
begin_operator
drop robot2 ball5 room3 left
1
2 2
2
0 28 -1 0
0 13 4 6
1
end_operator
begin_operator
drop robot2 ball5 room3 right
1
2 2
2
0 28 -1 0
0 16 4 6
1
end_operator
begin_operator
drop robot2 ball6 room1 left
1
2 0
2
0 18 -1 0
0 13 5 6
1
end_operator
begin_operator
drop robot2 ball6 room1 right
1
2 0
2
0 18 -1 0
0 16 5 6
1
end_operator
begin_operator
drop robot2 ball6 room2 left
1
2 1
2
0 20 -1 0
0 13 5 6
1
end_operator
begin_operator
drop robot2 ball6 room2 right
1
2 1
2
0 20 -1 0
0 16 5 6
1
end_operator
begin_operator
drop robot2 ball6 room3 left
1
2 2
2
0 29 -1 0
0 13 5 6
1
end_operator
begin_operator
drop robot2 ball6 room3 right
1
2 2
2
0 29 -1 0
0 16 5 6
1
end_operator
begin_operator
drop robot3 ball1 room1 left
1
1 0
2
0 24 -1 0
0 19 0 6
1
end_operator
begin_operator
drop robot3 ball1 room1 right
1
1 0
2
0 24 -1 0
0 21 0 6
1
end_operator
begin_operator
drop robot3 ball1 room2 left
1
1 1
2
0 4 -1 0
0 19 0 6
1
end_operator
begin_operator
drop robot3 ball1 room2 right
1
1 1
2
0 4 -1 0
0 21 0 6
1
end_operator
begin_operator
drop robot3 ball1 room3 left
1
1 2
2
0 5 -1 0
0 19 0 6
1
end_operator
begin_operator
drop robot3 ball1 room3 right
1
1 2
2
0 5 -1 0
0 21 0 6
1
end_operator
begin_operator
drop robot3 ball2 room1 left
1
1 0
2
0 25 -1 0
0 19 1 6
1
end_operator
begin_operator
drop robot3 ball2 room1 right
1
1 0
2
0 25 -1 0
0 21 1 6
1
end_operator
begin_operator
drop robot3 ball2 room2 left
1
1 1
2
0 6 -1 0
0 19 1 6
1
end_operator
begin_operator
drop robot3 ball2 room2 right
1
1 1
2
0 6 -1 0
0 21 1 6
1
end_operator
begin_operator
drop robot3 ball2 room3 left
1
1 2
2
0 8 -1 0
0 19 1 6
1
end_operator
begin_operator
drop robot3 ball2 room3 right
1
1 2
2
0 8 -1 0
0 21 1 6
1
end_operator
begin_operator
drop robot3 ball3 room1 left
1
1 0
2
0 9 -1 0
0 19 2 6
1
end_operator
begin_operator
drop robot3 ball3 room1 right
1
1 0
2
0 9 -1 0
0 21 2 6
1
end_operator
begin_operator
drop robot3 ball3 room2 left
1
1 1
2
0 26 -1 0
0 19 2 6
1
end_operator
begin_operator
drop robot3 ball3 room2 right
1
1 1
2
0 26 -1 0
0 21 2 6
1
end_operator
begin_operator
drop robot3 ball3 room3 left
1
1 2
2
0 11 -1 0
0 19 2 6
1
end_operator
begin_operator
drop robot3 ball3 room3 right
1
1 2
2
0 11 -1 0
0 21 2 6
1
end_operator
begin_operator
drop robot3 ball4 room1 left
1
1 0
2
0 12 -1 0
0 19 3 6
1
end_operator
begin_operator
drop robot3 ball4 room1 right
1
1 0
2
0 12 -1 0
0 21 3 6
1
end_operator
begin_operator
drop robot3 ball4 room2 left
1
1 1
2
0 14 -1 0
0 19 3 6
1
end_operator
begin_operator
drop robot3 ball4 room2 right
1
1 1
2
0 14 -1 0
0 21 3 6
1
end_operator
begin_operator
drop robot3 ball4 room3 left
1
1 2
2
0 27 -1 0
0 19 3 6
1
end_operator
begin_operator
drop robot3 ball4 room3 right
1
1 2
2
0 27 -1 0
0 21 3 6
1
end_operator
begin_operator
drop robot3 ball5 room1 left
1
1 0
2
0 15 -1 0
0 19 4 6
1
end_operator
begin_operator
drop robot3 ball5 room1 right
1
1 0
2
0 15 -1 0
0 21 4 6
1
end_operator
begin_operator
drop robot3 ball5 room2 left
1
1 1
2
0 17 -1 0
0 19 4 6
1
end_operator
begin_operator
drop robot3 ball5 room2 right
1
1 1
2
0 17 -1 0
0 21 4 6
1
end_operator
begin_operator
drop robot3 ball5 room3 left
1
1 2
2
0 28 -1 0
0 19 4 6
1
end_operator
begin_operator
drop robot3 ball5 room3 right
1
1 2
2
0 28 -1 0
0 21 4 6
1
end_operator
begin_operator
drop robot3 ball6 room1 left
1
1 0
2
0 18 -1 0
0 19 5 6
1
end_operator
begin_operator
drop robot3 ball6 room1 right
1
1 0
2
0 18 -1 0
0 21 5 6
1
end_operator
begin_operator
drop robot3 ball6 room2 left
1
1 1
2
0 20 -1 0
0 19 5 6
1
end_operator
begin_operator
drop robot3 ball6 room2 right
1
1 1
2
0 20 -1 0
0 21 5 6
1
end_operator
begin_operator
drop robot3 ball6 room3 left
1
1 2
2
0 29 -1 0
0 19 5 6
1
end_operator
begin_operator
drop robot3 ball6 room3 right
1
1 2
2
0 29 -1 0
0 21 5 6
1
end_operator
begin_operator
drop robot4 ball1 room1 left
1
0 0
2
0 24 -1 0
0 22 0 6
1
end_operator
begin_operator
drop robot4 ball1 room1 right
1
0 0
2
0 24 -1 0
0 23 0 6
1
end_operator
begin_operator
drop robot4 ball1 room2 left
1
0 1
2
0 4 -1 0
0 22 0 6
1
end_operator
begin_operator
drop robot4 ball1 room2 right
1
0 1
2
0 4 -1 0
0 23 0 6
1
end_operator
begin_operator
drop robot4 ball1 room3 left
1
0 2
2
0 5 -1 0
0 22 0 6
1
end_operator
begin_operator
drop robot4 ball1 room3 right
1
0 2
2
0 5 -1 0
0 23 0 6
1
end_operator
begin_operator
drop robot4 ball2 room1 left
1
0 0
2
0 25 -1 0
0 22 1 6
1
end_operator
begin_operator
drop robot4 ball2 room1 right
1
0 0
2
0 25 -1 0
0 23 1 6
1
end_operator
begin_operator
drop robot4 ball2 room2 left
1
0 1
2
0 6 -1 0
0 22 1 6
1
end_operator
begin_operator
drop robot4 ball2 room2 right
1
0 1
2
0 6 -1 0
0 23 1 6
1
end_operator
begin_operator
drop robot4 ball2 room3 left
1
0 2
2
0 8 -1 0
0 22 1 6
1
end_operator
begin_operator
drop robot4 ball2 room3 right
1
0 2
2
0 8 -1 0
0 23 1 6
1
end_operator
begin_operator
drop robot4 ball3 room1 left
1
0 0
2
0 9 -1 0
0 22 2 6
1
end_operator
begin_operator
drop robot4 ball3 room1 right
1
0 0
2
0 9 -1 0
0 23 2 6
1
end_operator
begin_operator
drop robot4 ball3 room2 left
1
0 1
2
0 26 -1 0
0 22 2 6
1
end_operator
begin_operator
drop robot4 ball3 room2 right
1
0 1
2
0 26 -1 0
0 23 2 6
1
end_operator
begin_operator
drop robot4 ball3 room3 left
1
0 2
2
0 11 -1 0
0 22 2 6
1
end_operator
begin_operator
drop robot4 ball3 room3 right
1
0 2
2
0 11 -1 0
0 23 2 6
1
end_operator
begin_operator
drop robot4 ball4 room1 left
1
0 0
2
0 12 -1 0
0 22 3 6
1
end_operator
begin_operator
drop robot4 ball4 room1 right
1
0 0
2
0 12 -1 0
0 23 3 6
1
end_operator
begin_operator
drop robot4 ball4 room2 left
1
0 1
2
0 14 -1 0
0 22 3 6
1
end_operator
begin_operator
drop robot4 ball4 room2 right
1
0 1
2
0 14 -1 0
0 23 3 6
1
end_operator
begin_operator
drop robot4 ball4 room3 left
1
0 2
2
0 27 -1 0
0 22 3 6
1
end_operator
begin_operator
drop robot4 ball4 room3 right
1
0 2
2
0 27 -1 0
0 23 3 6
1
end_operator
begin_operator
drop robot4 ball5 room1 left
1
0 0
2
0 15 -1 0
0 22 4 6
1
end_operator
begin_operator
drop robot4 ball5 room1 right
1
0 0
2
0 15 -1 0
0 23 4 6
1
end_operator
begin_operator
drop robot4 ball5 room2 left
1
0 1
2
0 17 -1 0
0 22 4 6
1
end_operator
begin_operator
drop robot4 ball5 room2 right
1
0 1
2
0 17 -1 0
0 23 4 6
1
end_operator
begin_operator
drop robot4 ball5 room3 left
1
0 2
2
0 28 -1 0
0 22 4 6
1
end_operator
begin_operator
drop robot4 ball5 room3 right
1
0 2
2
0 28 -1 0
0 23 4 6
1
end_operator
begin_operator
drop robot4 ball6 room1 left
1
0 0
2
0 18 -1 0
0 22 5 6
1
end_operator
begin_operator
drop robot4 ball6 room1 right
1
0 0
2
0 18 -1 0
0 23 5 6
1
end_operator
begin_operator
drop robot4 ball6 room2 left
1
0 1
2
0 20 -1 0
0 22 5 6
1
end_operator
begin_operator
drop robot4 ball6 room2 right
1
0 1
2
0 20 -1 0
0 23 5 6
1
end_operator
begin_operator
drop robot4 ball6 room3 left
1
0 2
2
0 29 -1 0
0 22 5 6
1
end_operator
begin_operator
drop robot4 ball6 room3 right
1
0 2
2
0 29 -1 0
0 23 5 6
1
end_operator
begin_operator
move robot1 room1 room2
0
1
0 3 0 1
1
end_operator
begin_operator
move robot1 room1 room3
0
1
0 3 0 2
1
end_operator
begin_operator
move robot1 room2 room1
0
1
0 3 1 0
1
end_operator
begin_operator
move robot1 room2 room3
0
1
0 3 1 2
1
end_operator
begin_operator
move robot1 room3 room1
0
1
0 3 2 0
1
end_operator
begin_operator
move robot1 room3 room2
0
1
0 3 2 1
1
end_operator
begin_operator
move robot2 room1 room2
0
1
0 2 0 1
1
end_operator
begin_operator
move robot2 room1 room3
0
1
0 2 0 2
1
end_operator
begin_operator
move robot2 room2 room1
0
1
0 2 1 0
1
end_operator
begin_operator
move robot2 room2 room3
0
1
0 2 1 2
1
end_operator
begin_operator
move robot2 room3 room1
0
1
0 2 2 0
1
end_operator
begin_operator
move robot2 room3 room2
0
1
0 2 2 1
1
end_operator
begin_operator
move robot3 room1 room2
0
1
0 1 0 1
1
end_operator
begin_operator
move robot3 room1 room3
0
1
0 1 0 2
1
end_operator
begin_operator
move robot3 room2 room1
0
1
0 1 1 0
1
end_operator
begin_operator
move robot3 room2 room3
0
1
0 1 1 2
1
end_operator
begin_operator
move robot3 room3 room1
0
1
0 1 2 0
1
end_operator
begin_operator
move robot3 room3 room2
0
1
0 1 2 1
1
end_operator
begin_operator
move robot4 room1 room2
0
1
0 0 0 1
1
end_operator
begin_operator
move robot4 room1 room3
0
1
0 0 0 2
1
end_operator
begin_operator
move robot4 room2 room1
0
1
0 0 1 0
1
end_operator
begin_operator
move robot4 room2 room3
0
1
0 0 1 2
1
end_operator
begin_operator
move robot4 room3 room1
0
1
0 0 2 0
1
end_operator
begin_operator
move robot4 room3 room2
0
1
0 0 2 1
1
end_operator
begin_operator
pick robot1 ball1 room1 left
1
3 0
2
0 24 0 1
0 7 6 0
1
end_operator
begin_operator
pick robot1 ball1 room1 right
1
3 0
2
0 24 0 1
0 10 6 0
1
end_operator
begin_operator
pick robot1 ball1 room2 left
1
3 1
2
0 4 0 1
0 7 6 0
1
end_operator
begin_operator
pick robot1 ball1 room2 right
1
3 1
2
0 4 0 1
0 10 6 0
1
end_operator
begin_operator
pick robot1 ball1 room3 left
1
3 2
2
0 5 0 1
0 7 6 0
1
end_operator
begin_operator
pick robot1 ball1 room3 right
1
3 2
2
0 5 0 1
0 10 6 0
1
end_operator
begin_operator
pick robot1 ball2 room1 left
1
3 0
2
0 25 0 1
0 7 6 1
1
end_operator
begin_operator
pick robot1 ball2 room1 right
1
3 0
2
0 25 0 1
0 10 6 1
1
end_operator
begin_operator
pick robot1 ball2 room2 left
1
3 1
2
0 6 0 1
0 7 6 1
1
end_operator
begin_operator
pick robot1 ball2 room2 right
1
3 1
2
0 6 0 1
0 10 6 1
1
end_operator
begin_operator
pick robot1 ball2 room3 left
1
3 2
2
0 8 0 1
0 7 6 1
1
end_operator
begin_operator
pick robot1 ball2 room3 right
1
3 2
2
0 8 0 1
0 10 6 1
1
end_operator
begin_operator
pick robot1 ball3 room1 left
1
3 0
2
0 9 0 1
0 7 6 2
1
end_operator
begin_operator
pick robot1 ball3 room1 right
1
3 0
2
0 9 0 1
0 10 6 2
1
end_operator
begin_operator
pick robot1 ball3 room2 left
1
3 1
2
0 26 0 1
0 7 6 2
1
end_operator
begin_operator
pick robot1 ball3 room2 right
1
3 1
2
0 26 0 1
0 10 6 2
1
end_operator
begin_operator
pick robot1 ball3 room3 left
1
3 2
2
0 11 0 1
0 7 6 2
1
end_operator
begin_operator
pick robot1 ball3 room3 right
1
3 2
2
0 11 0 1
0 10 6 2
1
end_operator
begin_operator
pick robot1 ball4 room1 left
1
3 0
2
0 12 0 1
0 7 6 3
1
end_operator
begin_operator
pick robot1 ball4 room1 right
1
3 0
2
0 12 0 1
0 10 6 3
1
end_operator
begin_operator
pick robot1 ball4 room2 left
1
3 1
2
0 14 0 1
0 7 6 3
1
end_operator
begin_operator
pick robot1 ball4 room2 right
1
3 1
2
0 14 0 1
0 10 6 3
1
end_operator
begin_operator
pick robot1 ball4 room3 left
1
3 2
2
0 27 0 1
0 7 6 3
1
end_operator
begin_operator
pick robot1 ball4 room3 right
1
3 2
2
0 27 0 1
0 10 6 3
1
end_operator
begin_operator
pick robot1 ball5 room1 left
1
3 0
2
0 15 0 1
0 7 6 4
1
end_operator
begin_operator
pick robot1 ball5 room1 right
1
3 0
2
0 15 0 1
0 10 6 4
1
end_operator
begin_operator
pick robot1 ball5 room2 left
1
3 1
2
0 17 0 1
0 7 6 4
1
end_operator
begin_operator
pick robot1 ball5 room2 right
1
3 1
2
0 17 0 1
0 10 6 4
1
end_operator
begin_operator
pick robot1 ball5 room3 left
1
3 2
2
0 28 0 1
0 7 6 4
1
end_operator
begin_operator
pick robot1 ball5 room3 right
1
3 2
2
0 28 0 1
0 10 6 4
1
end_operator
begin_operator
pick robot1 ball6 room1 left
1
3 0
2
0 18 0 1
0 7 6 5
1
end_operator
begin_operator
pick robot1 ball6 room1 right
1
3 0
2
0 18 0 1
0 10 6 5
1
end_operator
begin_operator
pick robot1 ball6 room2 left
1
3 1
2
0 20 0 1
0 7 6 5
1
end_operator
begin_operator
pick robot1 ball6 room2 right
1
3 1
2
0 20 0 1
0 10 6 5
1
end_operator
begin_operator
pick robot1 ball6 room3 left
1
3 2
2
0 29 0 1
0 7 6 5
1
end_operator
begin_operator
pick robot1 ball6 room3 right
1
3 2
2
0 29 0 1
0 10 6 5
1
end_operator
begin_operator
pick robot2 ball1 room1 left
1
2 0
2
0 24 0 1
0 13 6 0
1
end_operator
begin_operator
pick robot2 ball1 room1 right
1
2 0
2
0 24 0 1
0 16 6 0
1
end_operator
begin_operator
pick robot2 ball1 room2 left
1
2 1
2
0 4 0 1
0 13 6 0
1
end_operator
begin_operator
pick robot2 ball1 room2 right
1
2 1
2
0 4 0 1
0 16 6 0
1
end_operator
begin_operator
pick robot2 ball1 room3 left
1
2 2
2
0 5 0 1
0 13 6 0
1
end_operator
begin_operator
pick robot2 ball1 room3 right
1
2 2
2
0 5 0 1
0 16 6 0
1
end_operator
begin_operator
pick robot2 ball2 room1 left
1
2 0
2
0 25 0 1
0 13 6 1
1
end_operator
begin_operator
pick robot2 ball2 room1 right
1
2 0
2
0 25 0 1
0 16 6 1
1
end_operator
begin_operator
pick robot2 ball2 room2 left
1
2 1
2
0 6 0 1
0 13 6 1
1
end_operator
begin_operator
pick robot2 ball2 room2 right
1
2 1
2
0 6 0 1
0 16 6 1
1
end_operator
begin_operator
pick robot2 ball2 room3 left
1
2 2
2
0 8 0 1
0 13 6 1
1
end_operator
begin_operator
pick robot2 ball2 room3 right
1
2 2
2
0 8 0 1
0 16 6 1
1
end_operator
begin_operator
pick robot2 ball3 room1 left
1
2 0
2
0 9 0 1
0 13 6 2
1
end_operator
begin_operator
pick robot2 ball3 room1 right
1
2 0
2
0 9 0 1
0 16 6 2
1
end_operator
begin_operator
pick robot2 ball3 room2 left
1
2 1
2
0 26 0 1
0 13 6 2
1
end_operator
begin_operator
pick robot2 ball3 room2 right
1
2 1
2
0 26 0 1
0 16 6 2
1
end_operator
begin_operator
pick robot2 ball3 room3 left
1
2 2
2
0 11 0 1
0 13 6 2
1
end_operator
begin_operator
pick robot2 ball3 room3 right
1
2 2
2
0 11 0 1
0 16 6 2
1
end_operator
begin_operator
pick robot2 ball4 room1 left
1
2 0
2
0 12 0 1
0 13 6 3
1
end_operator
begin_operator
pick robot2 ball4 room1 right
1
2 0
2
0 12 0 1
0 16 6 3
1
end_operator
begin_operator
pick robot2 ball4 room2 left
1
2 1
2
0 14 0 1
0 13 6 3
1
end_operator
begin_operator
pick robot2 ball4 room2 right
1
2 1
2
0 14 0 1
0 16 6 3
1
end_operator
begin_operator
pick robot2 ball4 room3 left
1
2 2
2
0 27 0 1
0 13 6 3
1
end_operator
begin_operator
pick robot2 ball4 room3 right
1
2 2
2
0 27 0 1
0 16 6 3
1
end_operator
begin_operator
pick robot2 ball5 room1 left
1
2 0
2
0 15 0 1
0 13 6 4
1
end_operator
begin_operator
pick robot2 ball5 room1 right
1
2 0
2
0 15 0 1
0 16 6 4
1
end_operator
begin_operator
pick robot2 ball5 room2 left
1
2 1
2
0 17 0 1
0 13 6 4
1
end_operator
begin_operator
pick robot2 ball5 room2 right
1
2 1
2
0 17 0 1
0 16 6 4
1
end_operator
begin_operator
pick robot2 ball5 room3 left
1
2 2
2
0 28 0 1
0 13 6 4
1
end_operator
begin_operator
pick robot2 ball5 room3 right
1
2 2
2
0 28 0 1
0 16 6 4
1
end_operator
begin_operator
pick robot2 ball6 room1 left
1
2 0
2
0 18 0 1
0 13 6 5
1
end_operator
begin_operator
pick robot2 ball6 room1 right
1
2 0
2
0 18 0 1
0 16 6 5
1
end_operator
begin_operator
pick robot2 ball6 room2 left
1
2 1
2
0 20 0 1
0 13 6 5
1
end_operator
begin_operator
pick robot2 ball6 room2 right
1
2 1
2
0 20 0 1
0 16 6 5
1
end_operator
begin_operator
pick robot2 ball6 room3 left
1
2 2
2
0 29 0 1
0 13 6 5
1
end_operator
begin_operator
pick robot2 ball6 room3 right
1
2 2
2
0 29 0 1
0 16 6 5
1
end_operator
begin_operator
pick robot3 ball1 room1 left
1
1 0
2
0 24 0 1
0 19 6 0
1
end_operator
begin_operator
pick robot3 ball1 room1 right
1
1 0
2
0 24 0 1
0 21 6 0
1
end_operator
begin_operator
pick robot3 ball1 room2 left
1
1 1
2
0 4 0 1
0 19 6 0
1
end_operator
begin_operator
pick robot3 ball1 room2 right
1
1 1
2
0 4 0 1
0 21 6 0
1
end_operator
begin_operator
pick robot3 ball1 room3 left
1
1 2
2
0 5 0 1
0 19 6 0
1
end_operator
begin_operator
pick robot3 ball1 room3 right
1
1 2
2
0 5 0 1
0 21 6 0
1
end_operator
begin_operator
pick robot3 ball2 room1 left
1
1 0
2
0 25 0 1
0 19 6 1
1
end_operator
begin_operator
pick robot3 ball2 room1 right
1
1 0
2
0 25 0 1
0 21 6 1
1
end_operator
begin_operator
pick robot3 ball2 room2 left
1
1 1
2
0 6 0 1
0 19 6 1
1
end_operator
begin_operator
pick robot3 ball2 room2 right
1
1 1
2
0 6 0 1
0 21 6 1
1
end_operator
begin_operator
pick robot3 ball2 room3 left
1
1 2
2
0 8 0 1
0 19 6 1
1
end_operator
begin_operator
pick robot3 ball2 room3 right
1
1 2
2
0 8 0 1
0 21 6 1
1
end_operator
begin_operator
pick robot3 ball3 room1 left
1
1 0
2
0 9 0 1
0 19 6 2
1
end_operator
begin_operator
pick robot3 ball3 room1 right
1
1 0
2
0 9 0 1
0 21 6 2
1
end_operator
begin_operator
pick robot3 ball3 room2 left
1
1 1
2
0 26 0 1
0 19 6 2
1
end_operator
begin_operator
pick robot3 ball3 room2 right
1
1 1
2
0 26 0 1
0 21 6 2
1
end_operator
begin_operator
pick robot3 ball3 room3 left
1
1 2
2
0 11 0 1
0 19 6 2
1
end_operator
begin_operator
pick robot3 ball3 room3 right
1
1 2
2
0 11 0 1
0 21 6 2
1
end_operator
begin_operator
pick robot3 ball4 room1 left
1
1 0
2
0 12 0 1
0 19 6 3
1
end_operator
begin_operator
pick robot3 ball4 room1 right
1
1 0
2
0 12 0 1
0 21 6 3
1
end_operator
begin_operator
pick robot3 ball4 room2 left
1
1 1
2
0 14 0 1
0 19 6 3
1
end_operator
begin_operator
pick robot3 ball4 room2 right
1
1 1
2
0 14 0 1
0 21 6 3
1
end_operator
begin_operator
pick robot3 ball4 room3 left
1
1 2
2
0 27 0 1
0 19 6 3
1
end_operator
begin_operator
pick robot3 ball4 room3 right
1
1 2
2
0 27 0 1
0 21 6 3
1
end_operator
begin_operator
pick robot3 ball5 room1 left
1
1 0
2
0 15 0 1
0 19 6 4
1
end_operator
begin_operator
pick robot3 ball5 room1 right
1
1 0
2
0 15 0 1
0 21 6 4
1
end_operator
begin_operator
pick robot3 ball5 room2 left
1
1 1
2
0 17 0 1
0 19 6 4
1
end_operator
begin_operator
pick robot3 ball5 room2 right
1
1 1
2
0 17 0 1
0 21 6 4
1
end_operator
begin_operator
pick robot3 ball5 room3 left
1
1 2
2
0 28 0 1
0 19 6 4
1
end_operator
begin_operator
pick robot3 ball5 room3 right
1
1 2
2
0 28 0 1
0 21 6 4
1
end_operator
begin_operator
pick robot3 ball6 room1 left
1
1 0
2
0 18 0 1
0 19 6 5
1
end_operator
begin_operator
pick robot3 ball6 room1 right
1
1 0
2
0 18 0 1
0 21 6 5
1
end_operator
begin_operator
pick robot3 ball6 room2 left
1
1 1
2
0 20 0 1
0 19 6 5
1
end_operator
begin_operator
pick robot3 ball6 room2 right
1
1 1
2
0 20 0 1
0 21 6 5
1
end_operator
begin_operator
pick robot3 ball6 room3 left
1
1 2
2
0 29 0 1
0 19 6 5
1
end_operator
begin_operator
pick robot3 ball6 room3 right
1
1 2
2
0 29 0 1
0 21 6 5
1
end_operator
begin_operator
pick robot4 ball1 room1 left
1
0 0
2
0 24 0 1
0 22 6 0
1
end_operator
begin_operator
pick robot4 ball1 room1 right
1
0 0
2
0 24 0 1
0 23 6 0
1
end_operator
begin_operator
pick robot4 ball1 room2 left
1
0 1
2
0 4 0 1
0 22 6 0
1
end_operator
begin_operator
pick robot4 ball1 room2 right
1
0 1
2
0 4 0 1
0 23 6 0
1
end_operator
begin_operator
pick robot4 ball1 room3 left
1
0 2
2
0 5 0 1
0 22 6 0
1
end_operator
begin_operator
pick robot4 ball1 room3 right
1
0 2
2
0 5 0 1
0 23 6 0
1
end_operator
begin_operator
pick robot4 ball2 room1 left
1
0 0
2
0 25 0 1
0 22 6 1
1
end_operator
begin_operator
pick robot4 ball2 room1 right
1
0 0
2
0 25 0 1
0 23 6 1
1
end_operator
begin_operator
pick robot4 ball2 room2 left
1
0 1
2
0 6 0 1
0 22 6 1
1
end_operator
begin_operator
pick robot4 ball2 room2 right
1
0 1
2
0 6 0 1
0 23 6 1
1
end_operator
begin_operator
pick robot4 ball2 room3 left
1
0 2
2
0 8 0 1
0 22 6 1
1
end_operator
begin_operator
pick robot4 ball2 room3 right
1
0 2
2
0 8 0 1
0 23 6 1
1
end_operator
begin_operator
pick robot4 ball3 room1 left
1
0 0
2
0 9 0 1
0 22 6 2
1
end_operator
begin_operator
pick robot4 ball3 room1 right
1
0 0
2
0 9 0 1
0 23 6 2
1
end_operator
begin_operator
pick robot4 ball3 room2 left
1
0 1
2
0 26 0 1
0 22 6 2
1
end_operator
begin_operator
pick robot4 ball3 room2 right
1
0 1
2
0 26 0 1
0 23 6 2
1
end_operator
begin_operator
pick robot4 ball3 room3 left
1
0 2
2
0 11 0 1
0 22 6 2
1
end_operator
begin_operator
pick robot4 ball3 room3 right
1
0 2
2
0 11 0 1
0 23 6 2
1
end_operator
begin_operator
pick robot4 ball4 room1 left
1
0 0
2
0 12 0 1
0 22 6 3
1
end_operator
begin_operator
pick robot4 ball4 room1 right
1
0 0
2
0 12 0 1
0 23 6 3
1
end_operator
begin_operator
pick robot4 ball4 room2 left
1
0 1
2
0 14 0 1
0 22 6 3
1
end_operator
begin_operator
pick robot4 ball4 room2 right
1
0 1
2
0 14 0 1
0 23 6 3
1
end_operator
begin_operator
pick robot4 ball4 room3 left
1
0 2
2
0 27 0 1
0 22 6 3
1
end_operator
begin_operator
pick robot4 ball4 room3 right
1
0 2
2
0 27 0 1
0 23 6 3
1
end_operator
begin_operator
pick robot4 ball5 room1 left
1
0 0
2
0 15 0 1
0 22 6 4
1
end_operator
begin_operator
pick robot4 ball5 room1 right
1
0 0
2
0 15 0 1
0 23 6 4
1
end_operator
begin_operator
pick robot4 ball5 room2 left
1
0 1
2
0 17 0 1
0 22 6 4
1
end_operator
begin_operator
pick robot4 ball5 room2 right
1
0 1
2
0 17 0 1
0 23 6 4
1
end_operator
begin_operator
pick robot4 ball5 room3 left
1
0 2
2
0 28 0 1
0 22 6 4
1
end_operator
begin_operator
pick robot4 ball5 room3 right
1
0 2
2
0 28 0 1
0 23 6 4
1
end_operator
begin_operator
pick robot4 ball6 room1 left
1
0 0
2
0 18 0 1
0 22 6 5
1
end_operator
begin_operator
pick robot4 ball6 room1 right
1
0 0
2
0 18 0 1
0 23 6 5
1
end_operator
begin_operator
pick robot4 ball6 room2 left
1
0 1
2
0 20 0 1
0 22 6 5
1
end_operator
begin_operator
pick robot4 ball6 room2 right
1
0 1
2
0 20 0 1
0 23 6 5
1
end_operator
begin_operator
pick robot4 ball6 room3 left
1
0 2
2
0 29 0 1
0 22 6 5
1
end_operator
begin_operator
pick robot4 ball6 room3 right
1
0 2
2
0 29 0 1
0 23 6 5
1
end_operator
0
