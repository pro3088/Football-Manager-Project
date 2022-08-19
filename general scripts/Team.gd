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

#...........................................

var HomeTeam: Array
var AwayTeam: Array

var allPlayers: Array

var ballPos

var HomeBase


#create players to play according to team side and team color
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


# Create players for the Home Team
func Home(pitch,playerArray):
	for x in range(TeamNum):
		var append = playerArray[x]
		Playerbase.setHomePlayers(playerArray)
		Playerbase.setHomepositions(playerArray)
		Playerbase.setkickoff()
		pitch.add_child(append)

#Create players for the Away Team
func Away(pitch,playerArray):
	for x in range(TeamNum):
		var append = playerArray[x]
		Playerbase.setAwayPlayers(playerArray)
		Playerbase.setAwaypositions(playerArray)
		pitch.add_child(append)
	pass








