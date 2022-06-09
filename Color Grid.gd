extends Node2D

var detect:bool
var withball:bool

func _ready():
	print(WorldSpace.grid)
	grid()

func grid():
	for x in WorldSpace.grid:
		var colorrec = ColorRect.new()
		colorrec.color = Color(1,0,0,1)
		colorrec.set_global_position(x)
		colorrec.visible = true
		self.add_child(colorrec)
