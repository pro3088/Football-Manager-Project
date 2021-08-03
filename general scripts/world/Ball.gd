extends RigidBody2D

var player


func _process(_delta):
#	if player:
#		passball()
	
	pass

func moveball(position,force):
	if player:
		var dir = position - self.global_position
		set_linear_velocity(dir * force) 

func _on_Area2D_area_entered(area):
	player = area

func _on_Area2D_area_exited(_area):
	player = null
