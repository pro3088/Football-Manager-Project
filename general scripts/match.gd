extends Node2D

var Ball

var Awaygoal = 0
var Homegoal = 0

var team1 = Team.TeamSide.HomeSide
var team2 = Team.TeamSide.AwaySide

var HomeTeamArray = Array()
var AwayTeamArray = Array()

var allPlayerArray:Array

var HomeTeampos = Array()
var OppositionTeampos = Array()


func _ready():
	# A position 2d to position the ball at the middle of the field
	Ball = WorldSpace.ballResource
	self.add_child(Ball)
	Ball.global_transform.origin = WorldSpace.centerpos
	
	WorldSpace.training = false
	
	HomeTeam()
	AwayTeam()
	allPlayers()
	
	Team.HomeTeam = HomeTeamArray
	Team.AwayTeam = AwayTeamArray
	Team.ballPos = Ball.global_position
	
	Team.HomeTeam = HomeTeamArray
	Team.AwayTeam = AwayTeamArray
	Team.allPlayers = allPlayerArray

func _process(_delta):
	Team.ballPos = Ball.global_position

# Create Home players for the match play
func HomeTeam():
	Team.team = team1
	var homeTeam = $HomeTeam
	Team.CreatePlayers(homeTeam)
	var child = homeTeam.get_children()
	HomeTeamArray = child

# Create Away players for the match play
func AwayTeam():
	Team.team = team2
	var awayTeam  = $AwayTeam
	Team.CreatePlayers(awayTeam)
	var child = awayTeam.get_children()
	AwayTeamArray = child

# putting all players in a single array
func allPlayers():
	for a in HomeTeamArray:
		allPlayerArray.append(a)
	for b in AwayTeamArray:
		allPlayerArray.append(b)
	WorldSpace.allPlayerArray = allPlayerArray


