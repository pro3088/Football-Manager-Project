extends Node2D

##.........................................

var Ball

##..............................................

##...........................................

#To signify where the goal posts are and to signal when the
#ball is in the net 

var Othergoal = 0
var Homegoal = 0

var testTeamPosHome = Array()
var testTeamposAway = Array()

##...............................................

##..............................................

#To get the teams that are playing on the field and the side
#they are playing on
var team1 = Team.TeamSide.HomeSide
var team2 = Team.TeamSide.OtherSide

var HomeTeamArray = Array()
var OppositionTeamArray = Array()


var HomeTeampos = Array()
var OppositionTeampos = Array()
##...........................................


func _ready():
	# A position 2d to position the ball at the middle of the field
	var Ball_resource = load("res://world/Ball.tscn")
	Ball = Ball_resource.instance()
	self.add_child(Ball)
	Ball.global_transform.origin = WorldSpace.centerpos
	
	WorldSpace.training = false
	
	HomeTeam()
	OppositionTeam()
	Team.HomeTeam = HomeTeamArray
	Team.AwayTeam = OppositionTeamArray
	Team.ballPos = Ball.global_position
	
	Team.HomeTeam = HomeTeamArray
	Team.AwayTeam = OppositionTeamArray

func _process(_delta):
#	goal()
	Team.ballPos = Ball.global_position
	
###.....................................
#
##To get the goal count
#func goal():
#	if Home_goal.ball:
#		Othergoal +=1
#		pass
#		Ball.global_transform.origin = centerball
#	elif Other_goal.ball:
#		Homegoal +=1
#		pass
#		Ball.global_transform.origin = centerball
#
##.......................................
#
###......................................

# To create the players on the field
func HomeTeam():
	Team.team = team1
	var homeTeam = $HomeTeam
	Team.CreatePlayers(homeTeam)
	var child = homeTeam.get_children()
	HomeTeamArray = child
	
	


func OppositionTeam():
	Team.team = team2
	var awayTeam  = $AwayTeam
	Team.CreatePlayers(awayTeam)
	var child = awayTeam.get_children()
	OppositionTeamArray = child

##.......................................








