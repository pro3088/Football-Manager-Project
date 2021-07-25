extends KinematicBody2D

var velocity = Vector2.ZERO

var OriginalPos

var matchstart:bool = MatchPlay.matchstart

var teampossesion: bool

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
	ST
}


##................................

##Stats for the player
export(int) var speed = 200
export(String) var Position
export(String)var Name
export(int) var PlayerAge
export(playerroles) var Playerposition 
export(int) var attackStat
export(int) var dribbleStat
export(int) var passStat
export(int) var crossStat
export(int) var curveStat
export(int) var defenceStat
export(int) var shotPower
export(int) var maxSpeed
export(int) var minSpeed
export(int) var Physique
export(int) var form

##...............................

var team 


func _ready():
	OriginalPos = global_position
	if Team.team == Team.TeamSide.HomeSide:
		$"FOOTBALL_PLAYER SPRITE".modulate = Color(0, 0, 1)
	elif Team.team == Team.TeamSide.OtherSide:
		$"FOOTBALL_PLAYER SPRITE".modulate = Color(1, 0, 0)
	pass

func _physics_process(delta):
#	cal_move(delta)
	LookAtBall()
	ReturntoHome(delta)
	withBall()
	velocity = move_and_slide(velocity)

func cal_move(delta):
	if self == Team.ClosestToBall:
		var direction = Team.ballPos
		var self_pos = self.global_position
		var dir = direction - self_pos 
		velocity = dir * speed * delta
	else:
		velocity = Vector2.ZERO

func withBall():
	if $Ballholder.ball:
		return true
	return false

func LookAtBall():
	var ball = Team.ballPos
	self.look_at(ball)

func ReturntoHome(delta):
	if self != Team.ClosestToBall and global_position != OriginalPos:
		var dir = OriginalPos - global_position 
		velocity = dir * speed * delta
	pass

func teamPossesion():
	if Team.team == Team.TeamSide.HomeSide:
		teampossesion = Team.hometeampossesion
	elif Team.team == Team.TeamSide.OtherSide:
		teampossesion = Team.awayteampossesion

func Detectplayer():
	if $Detectplayer.player:
		return true
	return false

func movegrid():
	for x in range(10):
		var Ball_resource = load("res://world/Ball.tscn")
		var Ball = Ball_resource.instance()
		Ball.scale = Vector2(0.5,0.5)
		$Grid.add_child(Ball)
	pass
