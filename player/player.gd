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

##...............................

var team 

var leftsideline
var rightsideline
var forwardsideline

var player = self

var path

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
	Playerbase.playerposition = self.global_position
	path = Playerbase.playerpath
	LookAtBall()
	playerteam()
#	ReturntoHome(delta)
#	withBall()
#	Detectplayer()
#	teamPossesion()
	velocity = move_and_slide(velocity)

#..........................................................................


func cal_move():
	if self == Team.ClosestToBall:
		var direction = Team.ballPos
		var self_pos = self.global_position
		var dir = direction - self_pos 
		velocity = dir * speed * get_process_delta_time()
	else:
		velocity = Vector2.ZERO

func move_along_path():
	var distance = speed * get_process_delta_time()
	var last_point = self.global_position
	while path.size():
		var distance_between_points = last_point.distance_to(path[0])
		# The position to move to falls between two points.
		if distance <= distance_between_points:
			self.global_position = last_point.linear_interpolate(path[0], distance / distance_between_points)
			return
		# The position is past the end of the segment.
		distance -= distance_between_points
		last_point = path[0]
		path.remove(0)
	# The character reached the end of the path.
	self.global_position = last_point
#	set_process(false)


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
		print(self)
		return true
		yield(get_tree().create_timer(5), "time_out")
		if Team.team == Team.TeamSide.HomeSide:
			Team.hometeampossesion = false
		elif Team.team == Team.TeamSide.OtherSide:
			Team.awayteampossesion = false
		return false
	return false

func LookAtBall():
	var ball = Team.ballPos
	self.look_at(ball)

func ReturntoHome(delta):
	if self != Team.ClosestToBall and global_position != OriginalPos:
		var dir = OriginalPos - global_position 
		velocity = dir * speed * delta
	pass

func playerteam():
	if Team.team == Team.TeamSide.HomeSide:
		homeside = true
		awayside = false
	elif Team.team == Team.TeamSide.HomeSide:
		homeside = false
		awayside = true

#func teamPossesion():
#	if Team.team == Team.TeamSide.HomeSide:
#		teampossesion = Team.hometeampossesion
#	elif Team.team == Team.TeamSide.OtherSide:
#		teampossesion = Team.awayteampossesion

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

func getPolygons():
	return $CollisionPolygon2D.get_polygon()














