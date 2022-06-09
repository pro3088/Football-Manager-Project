extends Node

var grid:Array
var normGrid:Array

func _process(delta):
	normalizearray()

func normalizearray():
	var temparray = []
	var maxDis = 25
	var num1 = 0
	var num2 = 0
	if grid != null:
		for i in grid:
			num2 = 0
			for a in i:
				var val1 = a.y 
				var position
				var point = 0
				for b in Team.allPlayers:
					position = b.global_position
					if position.distance_to(a) < maxDis and position.distance_to(a) > -maxDis and point != 1:
						point = 1
				normGrid[num1][num2] = point
				num2 += 1
			num1 += 1














