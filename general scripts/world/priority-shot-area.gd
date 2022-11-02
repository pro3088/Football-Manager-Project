extends Node2D

var longShotPlayer
var shortShotPlayer 


func _on_longrangeshot_body_entered(body):
	longShotPlayer = body
	WorldSpace.goalDetected = true


func _on_longrangeshot_body_exited(_body):
	longShotPlayer = null
	WorldSpace.goalDetected = false


func _on_shortrangeshot_body_entered(body):
	shortShotPlayer = body
	WorldSpace.goalDetected = true


func _on_shortrangeshot_body_exited(_body):
	shortShotPlayer = null
	WorldSpace.goalDetected = false
