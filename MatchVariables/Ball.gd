extends RigidBody2D


#func _process(delta):
#	if WorldSpace.training:
#		self.global_position = WorldSpace.getposition()
#	pass


# One method to move, pass and shoot the ball
func moveBall(position: Vector2, force:float = 0.0, accuracy:float = 0.0, curve:int = 0): 
	var dir = position - self.global_position
	set_linear_velocity(dir * force * get_physics_process_delta_time())


#func _on_Area2D_area_entered(area):
#	player = area
#
#func _on_Area2D_area_exited(_area):
#	player = null
