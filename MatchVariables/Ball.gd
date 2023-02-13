extends RigidBody2D

var player

var training:bool = false

#func _process(delta):
#	if WorldSpace.training:
#		self.global_position = WorldSpace.getposition()
#	pass
#
## One method to move, pass and shoot the ball
#func moveBall(position: Vector2 = self.global_position , force:float = 0.0,  sprint:bool = false, accuracy:float = 0.0, curve:int = 0): 
#	if player:
#		pass
#
#		var dir = position - self.global_position
#		set_linear_velocity(dir * force)
#
#
#func _on_Area2D_area_entered(area):
#	player = area
#
#func _on_Area2D_area_exited(_area):
#	player = null
