extends Node2D

class_name AstarNode

class ArrayNode:
	
	var walkable:bool
	var worldPosition: Vector2
	var gridX
	var gridY
	
	var gCost: int
	var hCost: int
	var parent: ArrayNode
	
	func _init(_walkable:bool, _worldPos:Vector2, _gridX:int, _gridY:int):
		walkable = _walkable
		worldPosition = _worldPos
		gridX = _gridX
		gridY = _gridY
	
	func fCost():
		return gCost + hCost

var path:Array

var grid:Array
var nodeGrid:Array

var seeker: Vector2 
var target:Vector2

var startNode: ArrayNode
var targetNode: ArrayNode 

var allPlayers:Array

func _init(_grid):
	grid = _grid

#All grid position generated are normalized to walkable and non-walkable nodes
func normalizeNode():
	
#	var walkable:bool = false
#	var playerToPointMaxDistance = 25
#	var posTaken:bool
#	var playerArrayNo:int

	var notWalkable:Array
	
	for player in allPlayers:
		var gridPosition = positionToGrid(player.global_position)
		var gridNeighbours = getNeighbours(gridPosition)
		notWalkable.append(gridPosition)
		notWalkable.append_array(gridNeighbours)
	
	for node in notWalkable:
		node.walkable = false
	
#	if grid != null:
#		for i in grid:
#			for a in i:
#				posTaken = false
#				playerArrayNo = 0
#				for b in allPlayers:
#					var position = b.global_position
#					if position.distance_to(a.worldPosition) <= playerToPointMaxDistance or position.distance_to(a.worldPosition) <= -playerToPointMaxDistance and !posTaken:
#						posTaken = true
#						a.walkable = false
#						allPlayers.remove(playerArrayNo)
#						continue
#					playerArrayNo += 1

# Stores nodes around the parent node and returns array
func getNeighbours(node: ArrayNode):
	var neighbours:Array
	for y in range(-1,2):
		for x in range(-1,2):
			if x == 0 and y == 0:
				continue
			var checkX = node.gridX + x
			var checkY = node.gridY + y
			if checkX < 0 or checkX > 23:
				continue
			if checkY < 0 or checkY > 11:
				continue
			neighbours.append(grid[checkX][checkY])
	return neighbours

# returns an object Arraynode from a vector2 world position input
func positionToGrid(_position):
	var nearest = grid[0][0]
	var node: ArrayNode
	var num1 = 0
	var num2 = 0
	for row in grid:
		num2 = 0
		for col in grid:
			var point = grid[num1][num2].worldPosition
			if grid[num1][num2].worldPosition.distance_to(_position) < nearest.worldPosition.distance_to(_position):
				nearest = grid[num1][num2]
				node = grid[num1][num2]
			num2 += 1
		num1 += 1
	return node

# Generates a path from source to destination
func path(start:Vector2, end:Vector2):
	startNode = positionToGrid(start)
	targetNode = positionToGrid(end)
	
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
		
		if currentNode == targetNode:
			return RetracePath(startNode,targetNode)
		
		for neighbour in getNeighbours(currentNode):
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
	
	while (currentNode != startNode):
		path.append(currentNode)
		currentNode = currentNode.parent
	path.invert()
	return path

