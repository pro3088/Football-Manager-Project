extends Node2D

var playerscript = load("res://player/player.gd")

var ballscript = load("res://general scripts/world/Ball.gd")

var forwardplayers = ["CF","LWF","RWF","AMF"]

func task_passBall(task):
	var rand_position
	if !MatchPlay.matchstart:
		if get_parent().homeside:
			rand_position = Team.HomeTeam[randi() % Team.HomeTeam.size()]
		elif get_parent().awayside:
			rand_position = Team.AwayTeam[randi() % Team.AwayTeam.size()]
		WorldSpace.ballposition = rand_position.global_position
		WorldSpace.ballforce = 50 * get_physics_process_delta_time()
		MatchPlay.matchstart = true
	task.succeed()
	
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
#	ballscript.moveball(position,30)
#	if get_parent().global_position == position:
#		task.succeed()
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


func task_forwardplayer(task):
	for x in forwardplayers:
		if get_parent().role == x:
			task.succeed()
		else:
			task.failed()


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

func task_startgameplayer(task):
	if get_parent() == Playerbase.Kickoffplayer:
		task.succeed()
	else:
		task.failed()
	pass

func task_Sprinttogoal(task):
	if get_parent().homeside:
#		get_parent().move_along_path()
		pass
	pass

func task_withball(task):
	if get_parent().withBall():
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


