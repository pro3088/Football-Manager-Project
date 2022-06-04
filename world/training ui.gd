extends Node2D

var pressurebias
var defensebias

var hballpos
var vballpos

var defensiveline

var ballResource = WorldSpace.ballResource

func _physics_process(_delta):
	hballpos = $"VBoxContainer/ball pos".get_value()
	vballpos = $"VBoxContainer2/Vball pos".get_value()
	defensebias = $"VBoxContainer/defense bias".get_value()
	pressurebias= $"VBoxContainer/pressure bias".get_value()
	defensiveline = $"VBoxContainer/defensive line".get_value()
	
	WorldSpace.setposition(Vector2(hballpos + WorldSpace.centerpos.x,WorldSpace.centerpos.y + vballpos))
	Tactics.pressurebias = pressurebias
	Tactics.defensebias = defensebias
	Tactics.defenseLine = defensiveline

