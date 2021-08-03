extends Node2D

var playerscript = load("res://player/player.gd")

var ballscript = load("res://general scripts/world/Ball.gd")

var forwardplayers = ["CF","LWF","RWF","AMF"]

func task_passBall(task):
	
	pass

func task_shootBall(task):
	pass

func task_returnToHome(task):
	var position 
	var homeplayerbase = Playerbase.homePlayerPositions
	var awayplayerbase = Playerbase.awayPlayerPositions
	if get_parent().role == "CF":
		if Team.team == Team.TeamSide.HomeSide:
			position = homeplayerbase["CF"]
		elif Team.team == Team.TeamSide.OtherSide:
			position = awayplayerbase["CF"]
	if get_parent().role == "AMF":
		if Team.team == Team.TeamSide.HomeSide:
			position = homeplayerbase["AMF"]
		elif Team.team == Team.TeamSide.OtherSide:
			position = awayplayerbase["AMF"]
	if get_parent().role == "RWF":
		if Team.team == Team.TeamSide.HomeSide:
			position = homeplayerbase["RWF"]
		elif Team.team == Team.TeamSide.OtherSide:
			position = awayplayerbase["RWF"]
	if get_parent().role == "LWF":
		if Team.team == Team.TeamSide.HomeSide:
			position = homeplayerbase["LWF"]
		elif Team.team == Team.TeamSide.OtherSide:
			position = awayplayerbase["LWF"]
	ballscript.moveball(position,30)
	if get_parent().global_position == position:
		task.succeed()
	pass

func task_move(task):
	pass

func task_provideSupport(task):
	pass

func task_crossBall(task):
	pass

func task_withBall(task):
	if playerscript.withBall():
		task.succeed()
	else:
		task.failed()

func task_teamPossession(task):
	if playerscript.teampossesion:
		task.succeed()
	else:
		task.failed()
	pass

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

func task_playerChosenToPass(task):
	pass

func task_forwardplayer(task):
	for x in forwardplayers:
		if get_parent().role == x:
			task.succeed()
		else:
			task.failed()

func task_moveforward(task):
	pass

func task_moveleft(task):
	pass

func task_moveright(task):
	pass

func task_sprintforward(task):
	pass

func task_sprintleft(task):
	pass

func task_sprintright(task):
	pass

func task_runforward(task):
	pass

func task_runleft(task):
	pass

func task_runright(task):
	pass

func task_detectboundforward(task):
	if playerscript.sidelineforward:
		task.succeed()
	else:
		task.failed()
	pass

func task_detectboundleft(task):
	if playerscript.sidelineleft:
		task.succeed()
	else:
		task.failed()
	pass

func task_detectboundright(task):
	if playerscript.sidelineright:
		task.succeed()
	else:
		task.failed()
	pass

func task_foundpass(task):
	pass

func task_track_player(task):
	pass

func task_condition_support_requested(task):
	pass

func task_closesttogoal(task):
	pass
