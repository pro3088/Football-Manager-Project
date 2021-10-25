extends Node2D

var attackbias 
var defensebias
var ballpos
var defensiveline


func _physics_process(delta):
	ballpos = $"VBoxContainer/ball pos".get_value()
	defensebias = $"VBoxContainer/defense bias".get_value()
	attackbias = $"VBoxContainer/attack bias".get_value()
	defensiveline = $"VBoxContainer/defensive line".get_value()
	
	WorldSpace.setposition(Vector2(ballpos + WorldSpace.centerpos.x,WorldSpace.centerpos.y))
	WorldSpace.attackbias = attackbias
	WorldSpace.defensebias = defensebias
	WorldSpace.defensiveline = defensiveline



