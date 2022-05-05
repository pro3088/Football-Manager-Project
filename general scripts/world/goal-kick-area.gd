extends Area2D

var goalKick


func _on_goalkickarea_body_entered(body):
	goalKick = body

func _on_goalkickarea_body_exited(_body):
	goalKick = null
