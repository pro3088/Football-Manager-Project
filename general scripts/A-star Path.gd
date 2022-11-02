extends Node2D

# This creates an object for the A-star path algorithm and implementation
class ArrayNode:
	
	var walkable:bool
	var worldposition: Vector2
	var gridX
	var gridY
	
	var gCost: int
	var hCost: int
	var parent: ArrayNode
	
	func _init(_walkable:bool, _worldPos:Vector2, _gridX:int, _gridY:int):
		walkable = _walkable
		worldposition = _worldPos
		gridX = _gridX
		gridY = _gridY
	
	func fCost():
		return gCost + hCost

##..................................................................................
var pathGotten

var grid:Array
var nodeGrid:Array

var seeker: Vector2 
var target:Vector2

var startNode: ArrayNode
var targetNode: ArrayNode 


var rowNum = 20
var colNum = 25

func _process(delta):
	normalizeNode()

#All grid position generated are normalized to walkable and non-walkable nodes
func normalizeNode():
	var num1 = 0
	var num2 = 0
	
	var walkable:bool = false
	
	var playerToPointMaxDistance = 25
	
	if grid != null:
		for i in grid:
			num2 = 0
			for a in i:
				for b in Team.allPlayers:
					var point = 0
					var position = b.global_position
					if position.distance_to(a) < playerToPointMaxDistance and position.distance_to(a) > -playerToPointMaxDistance and point != 1:
						point = 1
						walkable = true
				var temp = nodeGrid[num1][num2]
				temp.walkable = walkable
				temp.worldposition = a
				temp.gridX = num1
				temp.gridY = num2
				num2 += 1
			num1 += 1

# Stores nodes around the parent node and returns array
func GetNeighbour(node: ArrayNode):
	var neighbour:Array
	for y in range(-1,2):
		for x in range(-1,2):
			if x == 0 and y == 0:
				continue
			var checkX = node.gridX + x
			var checkY = node.gridY + y
			if checkX < 0 or checkX > 20-1:
				continue
			if checkY < 0 or checkY > 25-1:
				continue
			neighbour.append(nodeGrid[checkX][checkY])
	return neighbour

# returns an object Arraynode from a vector2 world position input
func positiontogrid(_position):
	var nearest = grid[0][0]
	var node: ArrayNode
	var num1 = 0
	var num2 = 0
	for row in grid:
		num2 = 0
		for col in grid:
			if grid[num1][num2].distance_to(_position) < nearest.distance_to(_position):
				nearest = grid[num1][num2]
				node = nodeGrid[num1][num2]
			num2 += 1
		num1 += 1
	return node

# Generates a path from source to destination
func path(start,end):
	startNode = positiontogrid(start)
	targetNode = positiontogrid(end)
	
	var openSet:Array
	var closedSet: Array
	
	openSet.append(startNode)
	
	while (openSet.size() > 0):
		var currentNode: ArrayNode = openSet[0]
		for i in range(openSet.size()):
			if openSet[i].fCost() < currentNode.fCost() or openSet[i].fCost() == currentNode.fCost() and openSet[i].hCost < currentNode.hCost:
				currentNode = openSet[i]
		openSet.erase(currentNode)
		closedSet.append(currentNode)
#		print(openSet.size())
		
		if currentNode == targetNode:
			RetracePath(startNode,targetNode)
			return
		
		for neighbour in GetNeighbour(currentNode):
			if (!neighbour.walkable or closedSet.has(neighbour)):
				continue
			var newMovementCostToNeighbour = currentNode.gCost + GetDistance(currentNode, neighbour)
#			print(GetDistance(currentNode, neighbour))
			if (newMovementCostToNeighbour < neighbour.gCost or ! openSet.has(neighbour)):
				neighbour.gCost = newMovementCostToNeighbour
				neighbour.hCost = GetDistance(neighbour,targetNode)
				neighbour.parent = currentNode
				
				if (!openSet.has(neighbour)):
					openSet.append(neighbour)

func GetDistance(nodeA:ArrayNode, nodeB: ArrayNode):
	var dstX = abs(nodeA.gridX - nodeB.gridX)
	var dstY = abs(nodeA.gridY - nodeB.gridY)
	if dstX > dstY:
		return (14+dstY + 10*(dstX-dstY))
	return (14+dstX + 10*(dstY-dstX))

# After path is generated, this functions retraces the steps taken by the Astar algorithm 
# and stores the objects in an array
func RetracePath(startNode:ArrayNode, endNode:ArrayNode):
	var currentNode: ArrayNode = endNode
	var patht:Array
	
	while (currentNode != startNode):
		patht.append(currentNode)
		currentNode = currentNode.parent
	patht.invert()
	
	if pathGotten != patht:
		pathGotten = patht

