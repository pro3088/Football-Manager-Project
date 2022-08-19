extends Control

var sidebaropen:bool = false

func _on_Button_pressed():
	if !sidebaropen:
		$AnimationPlayer.play("Side bar")
		sidebaropen = true
	else:
		$AnimationPlayer.play_backwards("Side bar")
		sidebaropen = false
