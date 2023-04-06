def depthFirstSearch(problem):
stack = Stack()
explorednode = set()
startnode = problem.getStartState()
print('startnode = ', startnode)
stack.push((startnode,[]))
while stack.isEmpty() is not True:
currentnode, direction = stack.pop()
explorednode.add(currentnode)
if problem.isGoalState(currentnode):
print('Goal node reached at : ', currentnode)
return direction
for (successor, action, stepCost) in problem.getSuccessors(currentnode):
if successor not in explorednode:
stack.push((successor, direction + [action]))
print(successor)
def breadthFirstSearch(problem):
queue = Queue()
explorednode = set()startnode = problem.getStartState()
print ('startnode = ', startnode)
queue.push((startnode,[]))
while queue.isEmpty() is not True:
currentnode, direction = queue.pop()
if currentnode not in explorednode:
explorednode.add(currentnode)
if problem.isGoalState(currentnode):
print('Goal node reached at : ', currentnode)
return direction
for (successor, action, stepCost) in problem.getSuccessors(currentnode):
if successor not in explorednode:
queue.push((successor, direction + [action]))
print(successor)
def uniformCostSearch(problem):
pqueue = PriorityQueue()
explorednode = set()
startnode = problem.getStartState()
print ('startnode = ', startnode)
pqueue.push((startnode,[]),0)
while pqueue.isEmpty() is not True:
(currentnode,direction) = pqueue.pop()
if currentnode not in explorednode:
explorednode.add(currentnode)
if problem.isGoalState(currentnode):
return direction
print('Goal node reached at : ', currentnode)
for (successor, action, stepCost) in problem.getSuccessors(currentnode):
if successor not in explorednode:
pqueue.push((successor, direction + [action]), problem.getCostOfActions(direction
+ [action]))
print(successor)
def aStarSearch(problem, heuristic=nullHeuristic):
pqueue = PriorityQueue()
explorednode = set()
startnode = problem.getStartState()print ('startnode = ', startnode)
pqueue.push((startnode, []), 0)
while pqueue.isEmpty() is not True:
(currentnode, direction) = pqueue.pop()
if currentnode not in explorednode:
explorednode.add(currentnode)
if problem.isGoalState(currentnode):
return direction
print('Goal node reached at : ', currentnode)
for (successor, action, stepCost) in problem.getSuccessors(currentnode):
if successor not in explorednode:
pqueue.push((successor, direction + [action]), problem.getCostOfActions(direction
+ [action]) + heuristic(successor, problem))
print(successor)
util.raiseNotDefined()
def bidirection(problem):
q1 = Queue()
temp_q1 = []
q2 = Queue()
temp_q2 = []
explorednode1 = set()
explorednode2 = set()
startnode = problem.getStartState()
endnode = problem.goal
q1.push((startnode,[]))
q2.push((endnode, []))
while q1.isEmpty() is not True and q2.isEmpty() is not True:
if q1.isEmpty() is not True:
currentnode, direction = q1.pop()
if currentnode not in explorednode1:
explorednode1.add(currentnode)
if problem.isGoalState(currentnode) or (currentnode in temp_q2):
while q2.isEmpty() == False:
node, direc = q2.pop()
if node == currentnode:
solution = direction + direc.reverse()
return solutionfor(successor, action, stepCost) in problem.getSuccessors(currentnode):
q1.push((successor, direction + [action]))
print("Q1 : ", successor)
temp_q1.append(successor)
if q2.isEmpty() is not True:
currentnode, direction = q2.pop()
if currentnode not in explorednode2:
explorednode2.add(currentnode)
if currentnode in temp_q1:
while q1.isEmpty() == False:
node, direc = q1.pop()
if node == currentnode:
direction.reverse()
solution = direc + rev(direction)
return solution
for(successor, action, stepCost) in problem.getSuccessors(currentnode):
q2.push((successor, direction + [action]))
print("Q2 : ", successor)
temp_q2.append(successor)
def rev(direction):
j = []
for i in direction:
if i == 'North':
j.append('South')
elif i == 'South':
j.append('North')
elif i== 'East':
j.append('West')
else:
j.append('East')
return j
def manhattanHeuristic(position, problem, info={}):
xy1 = position
xy2 = problem.goal
return abs(xy1[0] - xy2[0]) + abs(xy1[1] - xy2[1])
def euclideanHeuristic(position, problem, info={}):xy1 = position
xy2 = problem.goal
return ( (xy1[0] - xy2[0]) ** 2 + (xy1[1] - xy2[1]) ** 2 ) ** 0.5
def chebyshevDistance(position, problem, info={}):
xy1 = position
xy2 = problem.goal
dx = abs(xy1[0] - xy2[0])
dy = abs(xy1[1] - xy2[1])
return max(dx, dy)
def cosineDistance(position, problem, info={}):
xy1 = position
xy2 = problem.goal
xy = xy1[0]*xy1[1] + xy2[0]*xy2[1]
x2 = (xy1[0] ** 2 + xy2[0] ** 2) ** 0.5
y2 = (xy1[1] ** 2 + xy2[1] ** 2) ** 0.5
return 1 - (xy / (x2*y2))
def canberraDistance(position, problem, info={}):
xy1 = position
xy2 = problem.goal
cdist = (abs(xy1[0] - xy1[1]) / abs(xy1[0] + xy1[1])) + (abs(xy2[0] - xy2[1]) / abs(xy2[0] +
xy2[1]))
return cdist
