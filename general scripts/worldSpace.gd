extends Node

var goalDetected: bool

var centerpos

var ballResource = preload("res://world/Ball.tscn").instance()

var homegoalposition
var awaygoalposition

var training:bool = false

var fieldExtents
var fieldPosition

var grid

var allPlayerArray

var lastWithBall

var homeTeamPossession: bool
var awayTeamPossession: bool

var matchstart:bool = false

var homescore:int
var awayscore:int

var restarthomeplay:bool = false #to restart play after a goal
var restartawayplay:bool = false #to restart play after a goal

var homegoal:Vector2 #position of home goal post
var awaygoal:Vector2#position of away goal post

var ballposition setget setposition, getposition

func setposition(position):
	ballposition = position

func getposition():
	return ballposition

func _ready():
	teamPossession()

func _process(delta):
	teamPossession()

#func GetClosesttoBall():
#	ClosestToBall = HomeTeam[0]
#	for x in HomeTeam:
#		if x.global_position.distance_to(ballPos) < ClosestToBall.global_position.distance_to(ballPos):
#			ClosestToBall = x
#	pass
#
#func GetClosestPlayer():
#	ClosestPlayer = HomeTeam[0]
#	for x in HomeTeam:
#		if x.global_position.distance_to(ClosestToBall.global_position) < ClosestPlayer.global_position.distance_to(ClosestToBall.global_position):
#			if x.global_position.distance_to(ClosestToBall.global_position) > 1:
#				ClosestPlayer = x

func closestToPress():
	var closestPlayer
	if allPlayerArray != null:
		for player in allPlayerArray:
			closestPlayer = player
			if homeTeamPossession:
				if player.awayside:
					if player.global_position.distance_to(lastWithBall.global_position) < closestPlayer.global_position.distance_to(lastWithBall.global_position) :
						closestPlayer = player
			elif awayTeamPossession:
				if player.homeside:
					if player.global_position.distance_to(lastWithBall.global_position) < closestPlayer.global_position.distance_to(lastWithBall.global_position) :
						closestPlayer = player
	return closestPlayer

func teamPossession():
	if allPlayerArray != null:
		for player in allPlayerArray:
			if player.withBall():
				lastWithBall = player
		if lastWithBall.homeside:
			homeTeamPossession = true
			awayTeamPossession = false
		elif lastWithBall.awayside:
			awayTeamPossession = true
			homeTeamPossession = false
#	print("home ",homeTeamPossession, " away ", awayTeamPossession)
