extends Node

# Divides the teams based on colour and type 
# whether the team is home or any colour both teams are divided

enum TeamSide {
	HomeSide
	OtherSide
}

var team 

var TeamNum = 11
var TotalPlayers = TeamNum * 2

var fieldPlayers = Array();

var teamPositionsHome = Array()
var teamPositionsAway = Array()

var ClosestToBall
var ClosestPlayer

var hometeampossesion: bool = true
var awayteampossesion: bool

var strayball
#............................................................................

func _ready():
	pass
	

func _process(_delta):
	GetClosesttoBall()
	GetClosestPlayer()
#	teamPossession()
	pass

#...........................................

var HomeTeam: Array
var AwayTeam: Array

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
		TeamSide.OtherSide:
			OtherSide(pitch,playerArray)
	
	pass


# this function creates the pitchs for the heam team
func Home(pitch,playerArray):
	for x in range(TeamNum):
		var append = playerArray[x]
		Playerbase.setHomePlayers(playerArray)
		Playerbase.setHomepositions(playerArray)
		pitch.add_child(append)

# this function creates the pitchs for the opposition team
func OtherSide(pitch,playerArray):
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
		else:
			hometeampossesion = false
			strayball = true
	pass










