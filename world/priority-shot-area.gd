extends Node2D

var longShotPlayer
var shortShotPlayer 



func _on_longrangeshot_body_entered(body):
	longShotPlayer = body



func _on_longrangeshot_body_exited(body):
	longShotPlayer = null




func _on_shortrangeshot_body_entered(body):
	shortShotPlayer = body




func _on_shortrangeshot_body_exited(body):
	shortShotPlayer = null
