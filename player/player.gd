extends KinematicBody2D

var velocity = Vector2.ZERO

var teampossesion: bool

#movement variables
var running:bool
var sprint:bool

var sprintRight:bool
var sprintLeft:bool

var moveBackLeft:bool
var moveBackRight:bool
var moveBack:bool
#..............................


var homeposition # original starting player position

enum playerroles{
	GK
	CB
	RB
	LB
	CDM
	CMF
	RMF
	LMF
	AMF
	SS
	LWF
	RWF
	CF
}


##Stats for the player
export(int) var speed = 100
export(String) var Name
export(String) var country
export(int) var age
export(playerroles) var role 
export(int) var attackStat
export(int) var dribbleStat
export(int) var passStat
export(int) var crossStat
export(int) var curveStat
export(int) var defenceStat
export(int) var shotPower
export(int) var maxSpeed
export(int) var minSpeed
export(int) var physique
export(int) var form
export(int) var stamina
##...............................

#team instruction familiarity
var counterattack: int = 1 # player tendency to progress play faster
var possession: int = 1 # player tendency to keep the ball and pick the best pass
var longPass: int = 1 #player tendency to play the ball long
var shortPass:int = 1 #player tendency to play short passes
var widePlay:int = 1 #player tendency to stay wide
var centerPlay:int = 1 #player tendency to play center
var maintainFormation:int = 1 #player tendency to keep his position
var flexible:int = 1 #player tendency to be flexible covering other positions
#.................................

#Bias
var attackBias:float = 0.3 # player tendency to move forward from 0 to 1
var defenseBias:float = 0.1 #player tendency to track back
#..................................


var team 

var leftsideline
var rightsideline
var forwardsideline

var player = self

var homeside:bool
var awayside:bool

func _ready():
	if Team.team == Team.TeamSide.HomeSide:
		$"FOOTBALL_PLAYER SPRITE".modulate = Color(0, 0, 1)
		homeside = true
	elif Team.team == Team.TeamSide.OtherSide:
		$"FOOTBALL_PLAYER SPRITE".modulate = Color(1, 0, 0)
		awayside = false
		#print(role, homeposition)
	pass
	
var ballpos

func _physics_process(delta):
	Playerbase.playerposition = self.global_position
	ballpos = Team.ballPos
	LookAtBall()
	playerteam()
	velocity = move_and_slide(velocity)

#..........................................................................



func cal_move():
	if self == Team.ClosestToBall:
		var direction = ballpos
		var self_pos = self.global_position
		var dir = direction - self_pos 
		velocity = dir * speed * get_process_delta_time()
	else:
		velocity = Vector2.ZERO

func move_along_path():
	var distance = speed * get_process_delta_time()
	var last_point = self.global_position


func move(position):
	if position != null:
		var dir = position - self.global_position
		velocity = dir * speed * get_physics_process_delta_time()
	else:
		velocity = Vector2.ZERO
	pass

func withBall():
	if $Ballholder.ball:
		return true
	elif !$Ballholder.ball and Team.playerwithball == self:
		yield(get_tree().create_timer(5), "time_out")
		if Team.team == Team.TeamSide.HomeSide:
			Team.hometeampossesion = false
		elif Team.team == Team.TeamSide.OtherSide:
			Team.awayteampossesion = false
		return false
	return false

func LookAtBall():
	self.look_at(ballpos)

func ReturntoHome(delta):
	if self != Team.ClosestToBall and global_position != homeposition:
		var dir = homeposition - global_position 
		velocity = dir * speed * delta
	pass

func playerteam():
	if Team.team == Team.TeamSide.HomeSide:
		homeside = true
		awayside = false
	elif Team.team == Team.TeamSide.HomeSide:
		homeside = false
		awayside = true

func Detectplayer():
	if $Detectplayer.player:
		return true
	return false

func detectsideline():
	if $"detect_left-sideline".sideline:
		leftsideline = true
	elif $"detect_right-sideline".sideline:
		rightsideline = true
	elif $"detect_forward-sideline".sideline:
		forwardsideline = true
	else:
		forwardsideline = false
		leftsideline = false
		rightsideline = false
		pass

func calculate_Move_Position():
	var centerpos = WorldSpace.centerpos
	var defenseLine = Tactics.defenseLine
	var movetoposition:Vector2 = homeposition
	var differentiator = ballpos - centerpos # difference btw the center pos and ball pos
	if homeside:
		if differentiator.x >= 10 :
			movetoposition.x = (differentiator.x * ((attackBias + defenseLine)/2)) + homeposition.x
			movetoposition.y = homeposition.y
		elif differentiator.x <=-10:
			movetoposition.x = (differentiator.x * ((attackBias + defenseLine)/2)) + homeposition.x
			movetoposition.y = homeposition.y
	elif awayside:
		if differentiator.x <= -10:
			movetoposition.x = (differentiator.x * ((attackBias + defenseLine)/2)) + homeposition.x
			movetoposition.y = homeposition.y
		elif differentiator.x >= 10:
			movetoposition.x = (differentiator.x * ((attackBias + defenseLine)/2)) + homeposition.x
			movetoposition.y = homeposition.y
	return movetoposition









