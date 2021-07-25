extends Node2D

var playerscript = preload("res://player/player.gd")

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

