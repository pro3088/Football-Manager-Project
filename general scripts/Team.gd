extends Node

# Divides the teams based on colour and type 
# whether the team is home or any colour both teams are divided

enum TeamSide {
	HomeSide
	AwaySide
}

var fieldPlayers = Array();

var teamPositionsHome = Array()
var teamPositionsAway = Array()

var hometeampossesion: bool
var awayteampossesion: bool

var TeamNum = 11
var TotalPlayers = TeamNum * 2

var ClosestToBall
var ClosestPlayer

var playerwithball

var team 

func _process(_delta):
	if HomeTeam.size() != 0:
		GetClosesttoBall()
		GetClosestPlayer()
#	teamPossession()
	pass

#...........................................

var HomeTeam: Array
var AwayTeam: Array

var allPlayers: Array

var ballPos

var HomeBase


# this function creates and loads pitchs into the field 
#based on the side or color
func CreatePlayers(pitch):
	var Player_resource = load("res://player/player.tscn")
	var playerArray = Array()
	fieldPlayers.resize(TeamNum)
	#This creates the pitchs for the loading
	for _x in range(fieldPlayers.size()):
		var Player = Player_resource.instance()
		playerArray.append(Player)
	
	
	match team :
		TeamSide.HomeSide:
			Home(pitch,playerArray)
		TeamSide.AwaySide:
			Away(pitch,playerArray)
	
	pass


# this function creates the pitchs for the heam team
func Home(pitch,playerArray):
	for x in range(TeamNum):
		var append = playerArray[x]
		Playerbase.setHomePlayers(playerArray)
		Playerbase.setHomepositions(playerArray)
		Playerbase.setkickoff()
		pitch.add_child(append)


func Away(pitch,playerArray):
	for x in range(TeamNum):
		var append = playerArray[x]
		Playerbase.setAwayPlayers(playerArray)
		Playerbase.setAwaypositions(playerArray)
		pitch.add_child(append)
	pass

func GetClosesttoBall():
	ClosestToBall = HomeTeam[0]
	for x in HomeTeam:
		if x.global_position.distance_to(ballPos) < ClosestToBall.global_position.distance_to(ballPos):
			ClosestToBall = x
	pass

func GetClosestPlayer():
	ClosestPlayer = HomeTeam[0]
	for x in HomeTeam:
		if x.global_position.distance_to(ClosestToBall.global_position) < ClosestPlayer.global_position.distance_to(ClosestToBall.global_position):
			if x.global_position.distance_to(ClosestToBall.global_position) > 1:
				ClosestPlayer = x

func teamPossession():
	for player in HomeTeam:
		if player.withBall():
			hometeampossesion = true
			playerwithball = player
	for player in AwayTeam:
		if player.withBall():
			awayteampossesion = true
			playerwithball = player
	pass










