extends KinematicBody2D

var velocity = Vector2.ZERO

var OriginalPos

var teampossesion: bool

var running:bool
var sprint:bool

var sprintRight:bool
var sprintLeft:bool

var moveBackLeft:bool
var moveBackRight:bool
var moveBack:bool


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


##................................

##Stats for the player
export(int) var speed = 200
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

##...............................

var team 

var leftsideline
var rightsideline
var forwardsideline

var player = self

var homeside:bool
var awayside:bool

func _ready():
	
	OriginalPos = global_position
	if Team.team == Team.TeamSide.HomeSide:
		$"FOOTBALL_PLAYER SPRITE".modulate = Color(0, 0, 1)
		homeside = true
	elif Team.team == Team.TeamSide.OtherSide:
		$"FOOTBALL_PLAYER SPRITE".modulate = Color(1, 0, 0)
		awayside = false
	pass

func _physics_process(delta):
#	cal_move(delta)
	LookAtBall()
#	ReturntoHome(delta)
#	withBall()
#	Detectplayer()
#	teamPossesion()
	velocity = move_and_slide(velocity)

#..........................................................................

func moveforward():
	if running:
		var smallpos:Array = $"Grid-middle-forward/running-forward".get_children()
		var rand_position = smallpos[randi() % smallpos.size()]
		return rand_position
	elif sprint:
		var smallpos:Array = $"Grid-middle-forward/sprint-forward".get_children()
		var rand_position = smallpos[randi() % smallpos.size()]
		return rand_position
	else:
		var smallpos:Array = $"Grid-middle-forward/small-move-forward".get_children()
		var rand_position = smallpos[randi() % smallpos.size()]
		return rand_position

func moveright():
	if sprintRight:
		var smallpos:Array = $"Grid-right/sprint-turn".get_children()
		var rand_position = smallpos[randi() % smallpos.size()]
		return rand_position
	else:
		var smallpos:Array = $"Grid-right/small-turn".get_children()
		var rand_position = smallpos[randi() % smallpos.size()]
		return rand_position

func moveleft():
	if sprintLeft:
		var smallpos:Array = $"Grid-left/sprint-turn".get_children()
		var rand_position = smallpos[randi() % smallpos.size()]
		return rand_position
	else:
		var smallpos:Array = $"Grid-left/small-turn".get_children()
		var rand_position = smallpos[randi() % smallpos.size()]
		return rand_position.global_position

func moveback():
	if moveBackLeft:
		var position = $"Grid-back/left".global_position
		return position
	elif moveBackRight:
		var position = $"Grid-back/right".global_position
		return position
	else:
		var position = $"Grid-back/middle"
		return position

#..............................................................................

func cal_move(delta):
	if self == Team.ClosestToBall:
		var direction = Team.ballPos
		var self_pos = self.global_position
		var dir = direction - self_pos 
		velocity = dir * speed * delta
	else:
		velocity = Vector2.ZERO

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
