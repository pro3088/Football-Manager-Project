extends Node2D

var playerscript = load("res://player/player.gd")

var ballResource = WorldSpace.ballResource

var forwardplayers = ["CF","LWF","RWF","AMF"]

func task_passBall(task):
	var passTarget
	if !WorldSpace.matchstart:
		if get_parent().homeside:
			for x in Team.HomeTeam:
				if x.role == 'SS':
					passTarget = x
				elif x.role == 'AMF':
					passTarget = x
				elif x.role == 'CMF':
					passTarget = x
		elif get_parent().awayside:
			for x in Team.AwayTeam:
				if x.role == 'SS':
					passTarget = x.global_position
				elif x.role == 'AMF':
					passTarget = x.global_position
				elif x.role == 'CMF':
					passTarget = x.global_position
		get_parent().ballpassed(get_parent(),passTarget)
		ballResource.passball(passTarget.global_position, 3 * get_process_delta_time())
		MatchPlay.matchstart = true
		task.succeed()

func task_shootBall(task):
	pass


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
	pass

func task_matchstart(task):
	if MatchPlay.matchstart:
		task.succeed()
	else:
		task.failed()

func task_detectopponent(task):
	if playerscript.Detectplayer():
		task.succeed()
	else:
		task.failed()
	pass

func task_training(task):
	if WorldSpace.training:
		task.succeed()
	else:
		task.failed()

func task_forwardplayer(task):
	for x in forwardplayers:
		if get_parent().role == x:
			task.succeed()
		else:
			task.failed()

func task_startgameplayer(task):
	if get_parent() == Playerbase.Kickoffplayer:
		task.succeed()
	else:
		task.failed()
	pass

func task_moveball(task):
	if get_parent().homeside: 
		if get_parent().ballholder:
			ballResource.pushball(get_parent().position + Vector2(100,0), 3 * get_process_delta_time() )
			print("working...............")
		pass
	pass

func task_withball(task):
	if get_parent().withBall():
		print("with balll")
		task.succeed()
	else:
		task.failed()
	pass

func task_moveToPosition(_task):
	if get_parent().homeside:
		var position = get_parent().calculate_Move_Position()
		get_parent().move(position)
	elif get_parent().awayside:
		var position = get_parent().calculate_Move_Position()
		get_parent().move(position)
		pass
	pass


