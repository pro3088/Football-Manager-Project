extends RigidBody2D

var player

var training:bool = false

func _process(delta):
	if training:
		self.global_position = WorldSpace.ballposition
	pass

func pushball(position: Vector2 = self.global_position , force:float = 0.0, left:bool = false,right:bool = false,  up:bool = false, sprint:bool = false): 
	if player:
		if left:
			right = false
		elif right:
			left = false
		
		var dir = position - self.global_position
		set_linear_velocity(dir * force)

func passball(location: Vector2 = Vector2(0,0),force:float = 0.0 ,accuracy:float = 0.0):
	if player:
		var dir = location - self.position
		set_linear_velocity(dir * force)
	pass

func shootball(location: Vector2 = Vector2(0,0),force:float = 0.0 ,accuracy:float = 0.0, curve:int = 0):
	pass


func _on_Area2D_area_entered(area):
	player = area

func _on_Area2D_area_exited(_area):
	player = null
