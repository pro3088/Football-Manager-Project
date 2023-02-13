extends Control

#func _ready():
#	WorldSpace.matchstart = false
#
#
#func _process(delta):
#	WorldSpace.matchstart = false

func _on_Match_pressed():
	get_tree().change_scene("res://world/Match-scene.tscn")


func _on_Training_pressed():
	get_tree().change_scene("res://world/Training-scene.tscn")
