extends Node2D

# all players need match start to move. this is a problem
# maybe a signal should be sent
# or a global script will be sent to the player and then match can start


var ballResource = WorldSpace.ballResource

var forwardplayers = ["CF","LWF","RWF","AMF"]

func task_kickoffpass(task):
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
					passTarget = x
				elif x.role == 'AMF':
					passTarget = x
				elif x.role == 'CMF':
					passTarget = x
		get_parent().ballpassed(get_parent(),passTarget)
		ballResource.moveBall(passTarget.global_position, 3 * get_process_delta_time())
		WorldSpace.matchstart = true
		task.succeed()
	else:
		task.failed()

func task_shootBall(task):
	pass


func task_withBall(task):
	if get_parent().withBall():                            
		task.succeed()
	else:
		task.failed()

func task_homepossession(task):
	if get_parent().homeside:
		if WorldSpace.homeTeamPossession:
			task.succeed()
		else:
			task.failed()

func task_awaypossession(task):
	if get_parent().awayside:
		if WorldSpace.awayTeamPossession:
			task.succeed()
		else:
			task.failed()

func possession():
	var poss: bool = false
	if get_parent().homeside:
		if WorldSpace.homeTeamPossession:
			poss = true
		else:
			poss = false
	elif get_parent().awayside:
		if WorldSpace.awayTeamPossession:
			poss = true
		else:
			poss = false
	return poss

func task_teampossession(task):
	if possession():
		task.succeed()
	else:
		task.failed()

func task_press(task):
	if get_parent() == WorldSpace.closestToPress():
		task.succeed()
	else:
		task.failed()

func task_goalAreaDetect(task):
	if WorldSpace.goalDetected :
		task.succeed()
	else:
		task.failed()
	pass

func task_matchstart(task):
	if WorldSpace.matchstart:
		task.succeed()
	else:
		task.failed()


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

func task_moveball(_task):
	if get_parent().homeside:
		Astar.path(get_parent().global_position, Vector2(717,188))
		ballResource.moveBall(Vector2(717,188), 3 * get_process_delta_time())
	pass


func task_moveToPosition(task):
	get_parent().move(get_parent().calculate_Move_Position())
