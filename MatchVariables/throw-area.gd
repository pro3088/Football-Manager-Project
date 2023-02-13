extends Area2D

var ballThrow

func _on_throwarea_body_entered(body):
	ballThrow = body


func _on_throwarea_body_exited(_body):
	ballThrow = null
