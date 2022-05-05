extends KinematicBody2D

var velocity = Vector2.ZERO

var teampossesion: bool

var ballResource = WorldSpace.ballResource

#movement variables
var running:bool
var sprint:bool

var sprintRight:bool
var sprintLeft:bool

var moveBackLeft:bool
var moveBackRight:bool
var moveBack:bool

var ballholder:bool = true
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
export(int) var speed = 20
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

var ballpos


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
	

func _physics_process(delta):
	Playerbase.playerposition = self.global_position
	pressureBias = Tactics.pressurebias
	defenseBias = Tactics.defensebias
	ballpos = Team.ballPos
	LookAtBall()
	playerteam()
#	trapball()
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

func move(position):
	if position != null:
		var dir = position - self.global_position
		velocity = dir * speed * get_physics_process_delta_time()
	else:
		velocity = Vector2.ZERO
	pass

func withBall():
	if $Ballholder.ball:
		print("with ball .................")
		return true
	elif !$Ballholder.ball and Team.playerwithball == self and ballholder:
		yield(get_tree().create_timer(0.4), "time_out")
		if Team.team == Team.TeamSide.HomeSide:
			Team.hometeampossesion = false
		elif Team.team == Team.TeamSide.OtherSide:
			Team.awayteampossesion = false
		return false
	elif !ballholder:
		return false
	return false

func trapball():
	var trapball
	if $Ballholder.ball:
		if !trapball :
			ballResource.trapball(self.position)
	else:
		trapball = false

func LookAtBall():
	self.look_at(ballpos)


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
	var centerpos = WorldSpace.centerpos
	var defenseLine = Tactics.defenseLine
	var movetoposition:Vector2 = homeposition
	var differentiator = ballpos - centerpos # difference btw the center pos and ball pos
	var Maxballx = 308 # max distance for ball position on the x axis
	var Maxballyup = 73
	var Maxballydown = 302
	
	# pressure..................................................................
	if homeside:
		# x-axis................................................................
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
		
		# defense...............................................................
		
		elif differentiator.x <= -10:
			if role == "CMF" or role == "AMF":
				movetoposition.x = (-(differentiator.x/ Maxballx) * ((hCDMpos.x + 10) - homeposition.x)) + homeposition.x
			elif role == "CB" or role == "RB" or role == "LB" or role == "CDM" or role == "GK":
				movetoposition.x = homeposition.x
			elif role == "LWF" or role == "RWF" or role == "LMF" or role == "RMF":
				movetoposition.x = (-(differentiator.x/ Maxballx) * ((hCBpos.x  + 50) - homeposition.x) * 0.7) + homeposition.x 
			elif role == "CF":
				movetoposition.x = (-(differentiator.x/ Maxballx) * ((hCBpos.x  + 50) - homeposition.x) * 0.3) + homeposition.x
		
		var mpUP = Vector2(125.127,99.781)
		var mpDOWN = Vector2(125.127,277.07)
		
		var marklineupy = (homeposition.y - Maxballyup) # the line for y axis up
		var marklinedowny = (homeposition.y - Maxballydown)
		
		# y-axis................................................................
		if role == "GK" :
			#up.................................................................
			if differentiator.y <= -10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklineupy)/marklineupy)) * (homeposition.y - mpUP.y) * 0.85)
			# down..............................................................
			elif differentiator.y >= 10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklinedowny)/marklinedowny)) * (homeposition.y - mpDOWN.y) * 0.85)
#				print((1 - ((differentiator.y + marklinedowny)/marklinedowny)))
		
		elif role == "CMF" :
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.6) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklineupy)/marklineupy)) * (homeposition.y - mpUP.y) * 0.7)
		
		elif role == "CDM" :
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.6) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklineupy)/marklineupy) ) * (homeposition.y - mpUP.y) * 0.5)
		
		elif  role == "AMF":
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.3) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklineupy)/marklineupy)) * (homeposition.y - mpUP.y))
		
		elif role == "CF":
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.8) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklineupy)/marklineupy)) * (homeposition.y - mpUP.y) * 0.6)
		
		elif role == "RWF":
			if differentiator.y <= -10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklineupy)/marklineupy)) * (homeposition.y - (mpDOWN.y + 20)))
		
		elif role =="LWF":
			if differentiator.y <= -10:
				movetoposition.y = ((((mpUP.y - homeposition.y)/differentiator.y) * differentiator.y) * 0.3) + homeposition.y
		
	#away side
	return movetoposition

func ballpassed(passer,object):
	if self == passer:
		ballholder = false
		pass
	elif self == object:
		ballholder = true
		pass
	pass







