extends Node2D

##.........................................

# A position 2d to position the ball at the middle of the field
onready var centerball = get_node("positions/center-line").global_transform.origin

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
	var Ball_resource = load("res://world/Ball.tscn")
	Ball = Ball_resource.instance()
	self.add_child(Ball)
	Ball.global_transform.origin = centerball
	
	HomeTeam()
	OppositionTeam()
	Team.HomeTeam = HomeTeamArray
	Team.OppositionTeam = OppositionTeamArray
	Team.ballPos = Ball.global_position


func _process(_delta):
#	goal()
	Getplayerpos()
	Team.ballPos = Ball.global_position
	Team.HomeTeam = HomeTeamArray
	Team.OppositionTeam = OppositionTeamArray
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

func Getplayerpos():
	for x in range(11):
		var getvalues = HomeTeamArray[x]
		var homeplayerpos  = getvalues.global_position
		HomeTeampos.append(homeplayerpos)
	HomeTeampos.resize(11)
	for x in range(11):
		var append = OppositionTeamArray[x]
		var Oppositionplayerpos  = append.global_position
		OppositionTeampos.append(Oppositionplayerpos)
	OppositionTeampos.resize(11)









