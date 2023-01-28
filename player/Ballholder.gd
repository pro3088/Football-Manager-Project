extends Area2D

var ball

func _on_Ballholder_body_entered(body):
	ball = body


func _on_Ballholder_body_exited(_body):
	ball = null
