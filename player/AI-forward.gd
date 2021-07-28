extends Node2D

var playerscript = preload("res://player/player.gd")

var forwardplayers = ["CF","LWF","RWF","AMF"]

func task_passBall(task):
	pass

func task_shootBall(task):
	pass

func task_returnToHome(task):
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
	pass

func task_matchstart(task):
	if MatchPlay.matchstart:
		task.succeed()
	else:
		task.failed()

func task_detectopponent(task):
	pass

func task_playerChosenToPass(task):
	pass

func task_forwardplayer(task):
	for x in forwardplayers:
		if playerscript.role == x:
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
	pass

func task_detectboundleft(task):
	pass

func task_detectboundright(task):
	pass

func task_foundpass(task):
	pass







