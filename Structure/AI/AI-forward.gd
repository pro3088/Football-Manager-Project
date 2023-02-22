extends Node2D

var playerscript = load("res://player/player.gd")

var kickOff:bool

#var ballResource = WorldSpace.ballResource

func task_kickOff(task):
	if WorldSpace.matchStart:
		task.succeed()
	else:
		task.failed()

func task_passBall(task):
	if !kickOff:
		get_parent().passBall("CMF")
		kickOff = true
	task.succeed()

func task_shootBall(task):
	get_parent().shootBall()
	task.succeed()

func task_canShoot(task):
	if get_parent().canShoot():
		task.succeed()
	else:
		task.failed()

func task_withBall(task):
	if get_parent().withBall():                            
		task.succeed()
	else:
		task.failed()

#func task_teamPossession(task):
#	if get_parent().teampossesion:
#		print("Team have possession")
#		task.succeed()
#	else:
#		task.failed()
#	pass

func task_goalAreaDetect(task):
	if WorldSpace.goalDetected :
		task.succeed()
	else:
		task.failed()

#func task_detectopponent(task):
#	if playerscript.Detectplayer():
#		task.succeed()
#	else:
#		task.failed()
#	pass

func task_moveToPosition(_task):
	if get_parent().homeside:
		var position = get_parent().calculate_Move_Position()
		get_parent().move(position)
	elif get_parent().awayside:
		var position = get_parent().calculate_Move_Position()
		get_parent().move(position)
		pass
	pass


