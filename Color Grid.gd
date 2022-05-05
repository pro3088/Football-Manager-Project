extends Node2D

var detect:bool
var withball:bool

func _ready():
	print(WorldSpace.grid)
	grid()


#func _process(delta):
#	$ColorRect.color = Color(14,255,0,255)
#	if withball:
#		$ColorRect.visible = true
#		if detect:
#			$ColorRect.color = Color(1,0,0,1)
#		else:
#			$ColorRect.color = Color(14,255,0,255)
#	else:
#		$ColorRect.visible = false


func grid():
	for x in WorldSpace.grid:
		var colorrec = ColorRect.new()
		colorrec.color = Color(1,0,0,1)
		colorrec.set_global_position(x)
		colorrec.visible = true
		self.add_child(colorrec)
