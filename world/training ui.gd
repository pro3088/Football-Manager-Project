extends Node2D

var pressurebias
var defensebias
var ballpos
var defensiveline


func _physics_process(_delta):
	ballpos = $"VBoxContainer/ball pos".get_value()
	defensebias = $"VBoxContainer/defense bias".get_value()
	pressurebias= $"VBoxContainer/pressure bias".get_value()
	defensiveline = $"VBoxContainer/defensive line".get_value()
	
	WorldSpace.setposition(Vector2(ballpos + WorldSpace.centerpos.x,WorldSpace.centerpos.y))
	Tactics.pressurebias = pressurebias
	Tactics.defensebias = defensebias
	Tactics.defenseLine = defensiveline

