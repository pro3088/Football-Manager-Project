extends Node2D


var colNum = 25
var rowNum = 20

var nodeH
var nodeW
var nodeDiameter
var gridSizeX 
var gridSizeY

var gridArray:Array
var pathArray:Array
var normNode:Array

func _ready():
	pass


func grid(fieldExtents,fieldPosition,addValue):
	
	Astar.rowNum = rowNum
	Astar.colNum = colNum
	
	var startPosition = Vector2.ZERO
	startPosition.x = (fieldPosition.x - fieldExtents.x) + addValue.x
	startPosition.y = (fieldPosition.y - fieldExtents.y) + addValue.y
	var spaceX = (fieldExtents.x * 2)/colNum
	var spaceY = (fieldExtents.y * 2)/rowNum
	var newposition = startPosition
	var position = newposition
	for _i in range(0,colNum):
		var positionx = Position2D.new()
		positionx.position = newposition
		gridArray.append(positionx.position)
		for _k in range(0,rowNum - 1):
			var positiony = Position2D.new()
			position = position + Vector2(0,spaceY)
			positiony.position = position
			gridArray.append(positiony.position)
		newposition = newposition + Vector2(spaceX,0)
		position = newposition

func sortedGrid(Tarray):
	var minvalY = Tarray[0].y
	var temparray = []
	for num in range(0,rowNum):
		minvalY = Tarray[0].y
		for i in Tarray:
			minvalY = min(minvalY,i.y)
		for a in Tarray:
			if a.y == minvalY:
				temparray.append(a)
		pathArray.append(temparray)
		for b in temparray:
			for c in Tarray:
				if b == c:
					var idx = Tarray.find(b)
					Tarray.remove(idx)
		temparray = []

func normNode():
	var temparray:Array = []
	var walkable:bool = false
	for i in pathArray:
		for a in i:
			temparray.append(Astar.ArrayNode.new(walkable,a,a.x,a.y))
		normNode.append(temparray)
		temparray = []
















