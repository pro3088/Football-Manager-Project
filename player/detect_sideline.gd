extends Area2D

var sideline



func _on_detect_sideline_area_entered(area):
	sideline = area


func _on_detect_sideline_area_exited(_area):
	sideline = null
