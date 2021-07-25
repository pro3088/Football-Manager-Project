extends RigidBody2D

signal passball

var player


func _process(_delta):
#	if player:
#		passball()
	
	pass

func passball():
	var direction = Team.ClosestPlayer.global_position
	var self_pos = self.global_position
	var dir = direction - self_pos 
	set_sleeping(false) 
	set_linear_velocity(dir * 30) 
	emit_signal("passball")



func _on_Area2D_area_entered(area):
	player = area

func _on_Area2D_area_exited(_area):
	player = null
