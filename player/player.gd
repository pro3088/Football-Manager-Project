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
var pressureBias:float = 0.3 # player tendency to move forward from 0 to 1
var defenseBias:float = 0.1 #player tendency to track back
var linebiasGK:float = 0.6
var linebiasCB:float = 0.8
var linebiasCDM:float = 0.9
var linebiasCMF:float = 0.95
var defensivebias:float = 0.5
var hCBpos
var hCDMpos
var aCBpos
var aCDMpos
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
	hCBpos = Playerbase.hCBposition
	hCDMpos = Playerbase.hCDMposition
	aCBpos = Playerbase.aCBposition
	aCDMpos = Playerbase.aCDMposition
		#print(role, homeposition)
	pass
	
var ballpos

func _physics_process(delta):
	Playerbase.playerposition = self.global_position
	pressureBias = Tactics.pressurebias
	defenseBias = Tactics.defensebias
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
	
	# this function gives the formation location each player is required to move to 
	#this is done by separating the function into three segments:
	# the pressure
	# the defense
	# and during possession
	# All three segments have their own unique formulaes that calculate their position based on team requirements
	
	# During pressure the distance between the ball and the center line is first noted>>
	# If the distance the greater than 10 for home side and less for away, the players begin to pressure the opposition
	# else they stay in their home position
	# the formula used is>> (bw * k) + homeposition -> only for the x axis
	# where: bw = difference between ball position and center line
	# k = external variables -> pressure bias and defense line( how high the defensive line is)
	
	# During defense the distance is also noted, same principles as pressure but reversed
	# the formula used is >>> ((dw * bw) * k) + homeposition
	# where dw = pw/bwl
	#k = external variables -> defense bias and defense line
	# where pw = mp - homeposition
	# bwl = bw
	 
	var centerpos = WorldSpace.centerpos
	var defenseLine = Tactics.defenseLine
	var movetoposition:Vector2 = homeposition
	var differentiator = ballpos - centerpos # difference btw the center pos and ball pos
	
	# pressure
	if homeside:
		if differentiator.x >= 10 :
			movetoposition.x = (differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x
			if role == "GK":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * linebiasGK
				if movetoposition.x <= homeposition.x:
					movetoposition.x = homeposition.x
					movetoposition.y = homeposition.y
			elif role == "CB":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * linebiasCB
				if movetoposition.x <= homeposition.x:
					movetoposition.x = homeposition.x
			elif role == "CDM":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * linebiasCDM
				if movetoposition.x <= homeposition.x:
					movetoposition.x = homeposition.x
			elif role == "CMF":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * linebiasCMF
				if movetoposition.x <= homeposition.x:
					movetoposition.x = homeposition.x
		
		# defense
		elif differentiator.x <= -10:
			if role == "CMF" or role == "AMF":
				movetoposition.x = ((((((hCDMpos.x + 10) - homeposition.x)/differentiator.x) * differentiator.x) * ((defenseBias * defenseLine)/2))) + homeposition.x
			elif role == "CB" or role == "RB" or role == "LB" or role == "CDM" or role == "GK":
				movetoposition.x = homeposition.x
			elif role == "LWF" or role == "RWF" or role == "LMF" or role == "RMF":
				movetoposition.x = ((((((hCBpos.x + 10) - homeposition.x)/differentiator.x) * differentiator.x) * ((defenseBias * defenseLine)/2))) + homeposition.x
		
		var mpUP = Vector2(125.127,99.781)
		var mpDOWN = Vector2(125.127,277.07)
		if role == "GK" :
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.9) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = ((((mpUP.y - homeposition.y)/differentiator.y) * differentiator.y) * 0.3) + homeposition.y
		
		elif role == "CMF" :
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.6) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = ((((mpUP.y - homeposition.y)/differentiator.y) * differentiator.y) * 0.3) + homeposition.y
		
		elif role == "CDM" :
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.6) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = ((((mpUP.y - homeposition.y)/differentiator.y) * differentiator.y) * 0.3) + homeposition.y
		
		elif  role == "AMF":
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.3) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = ((((mpUP.y - homeposition.y)/differentiator.y) * differentiator.y) * 0.3) + homeposition.y
		
		elif role == "CF":
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.8) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = ((((mpUP.y - homeposition.y)/differentiator.y) * differentiator.y) * 0.3) + homeposition.y
		
	#away side
	elif awayside:
		if differentiator.x <= -10 :
			movetoposition.x = (differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x
			if role == "GK":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * linebiasGK
				if movetoposition.x >= homeposition.x:
					movetoposition.x = homeposition.x
			elif role == "CB":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * linebiasCB
				if movetoposition.x >= homeposition.x:
					movetoposition.x = homeposition.x
			elif role == "CDM":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * linebiasCDM
				if movetoposition.x >= homeposition.x:
					movetoposition.x = homeposition.x
			elif role == "CMF":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * linebiasCMF
				if movetoposition.x >= homeposition.x:
					movetoposition.x = homeposition.x
			
			movetoposition.y = homeposition.y
			
		# defensive form
		if differentiator.x >= 10:
			if role == "CMF" or role == "AMF":
				movetoposition.x = ((((((aCDMpos.x + 10) - homeposition.x)/differentiator.x) * differentiator.x) * ((defenseBias * defenseLine)/2))) + homeposition.x
			elif role == "CB" or role == "RB" or role == "LB" or role == "CDM" or role == "GK":
				movetoposition.x = homeposition.x
			elif role == "LWF" or role == "RWF" or role == "LMF" or role == "RMF":
				movetoposition.x = ((((((aCBpos.x + 10) - homeposition.x)/differentiator.x) * differentiator.x) * ((defenseBias * defenseLine)/2))) + homeposition.x
			movetoposition.y = homeposition.y
	return movetoposition









