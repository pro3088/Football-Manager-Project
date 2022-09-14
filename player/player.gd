extends KinematicBody2D

<<<<<<< HEAD
var speed
var role

var stats
var bias
var teamSide

func _init(_stats:Object, _bias:Object, _teamSide, _color:Color):
	stats = _stats
	bias = _bias
	teamSide = _teamSide

#Bias
var pressureBias:float = 0.3 # player tendency to move forward from 0 to 1
var defenseBias:float = 0.4 #player tendency to track back
var linebiasGK:float = 0.6
var linebiasCB:float = 0.8
var linebiasCDM:float = 0.9
var linebiasCMF:float = 0.95
var AlinebiasGK:float = 1.5
var AlinebiasCB:float = 1.25
var AlinebiasCDM:float = 1.2
var AlinebiasCMF:float = 1.1
var defensivebias:float = 0.5
var hCBpos
var hCDMpos
#..................................


var player = self

var ballResource = WorldSpace.ballResource

var velocity = Vector2.ZERO

var homeposition # original starting player position
var ballpos

var ballholder:bool = true

var teampossesion: bool = false

var homeside: bool
var awayside: bool

=======
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

#PLayer Stats
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
#...............................

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
var defenseBias:float = 0.4 #player tendency to track back
var linebiasGK:float = 0.6
var linebiasCB:float = 0.8
var linebiasCDM:float = 0.9
var linebiasCMF:float = 0.95
var AlinebiasGK:float = 1.5
var AlinebiasCB:float = 1.25
var AlinebiasCDM:float = 1.2
var AlinebiasCMF:float = 1.1
var defensivebias:float = 0.5
var hCBpos
var hCDMpos
#..................................

#movement variables
var running:bool
var sprint:bool
var press:bool
#..............................

var player = self

var ballResource = WorldSpace.ballResource

var velocity = Vector2.ZERO

var homeposition # original starting player position
var ballpos

var ballholder:bool = true

var teampossesion: bool = false

var homeside: bool
var awayside: bool

>>>>>>> cd3bdc3164f2d96797ac4f38e9add5d70e4475d3
var movePosition


func _ready():
	if Team.team == Team.TeamSide.HomeSide:
		$"FOOTBALL_PLAYER SPRITE".modulate = Color(0, 0, 1)
		homeside = true
	elif Team.team == Team.TeamSide.AwaySide:
		$"FOOTBALL_PLAYER SPRITE".modulate = Color(1, 0, 0)
		awayside = true
	hCBpos = Playerbase.hCBposition
	hCDMpos = Playerbase.hCDMposition
	

func _physics_process(_delta):
	Playerbase.playerposition = self.global_position
	pressureBias = Tactics.pressurebias
	defenseBias = Tactics.defensebias
	ballpos = Team.ballPos
	LookAtBall()
<<<<<<< HEAD
=======
	press()
>>>>>>> cd3bdc3164f2d96797ac4f38e9add5d70e4475d3
	velocity = move_and_slide(velocity)

#..........................................................................


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
	self.look_at(ballpos)

func calculate_Move_Position():
	# this function gives the formation location each player is required to move to 
	var centerpos = WorldSpace.centerpos
	var defenseLine = Tactics.defenseLine
	var movetoposition:Vector2 = homeposition
	var differentiator = ballpos - centerpos # difference btw the center position and ball pos
	var Maxballx = centerpos.x - 80 # max distance for ball position on the x axis
	var AMaxballx = centerpos.x + 80
	var Maxballyup = 73
	var Maxballydown = 302
	var touchline = Tactics.touchline
	
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
				movetoposition.x = (-(differentiator.x/ Maxballx) * ((hCDMpos.x + 10) - homeposition.x)) * defenseBias + homeposition.x
			elif role == "CB" or role == "RB" or role == "LB" or role == "CDM" or role == "GK":
				movetoposition.x = homeposition.x
			elif role == "LWF" or role == "RWF" or role == "LMF" or role == "RMF":
				movetoposition.x = (-(differentiator.x/ Maxballx) * ((hCBpos.x  + 50) - homeposition.x) * 0.7) * defenseBias + homeposition.x 
			elif role == "CF":
				movetoposition.x = (-(differentiator.x/ Maxballx) * ((hCBpos.x  + 50) - homeposition.x) * 0.3) * defenseBias + homeposition.x
		
		var mpUP = Vector2(125.127,99.781)
		var mpDOWN = Vector2(125.127,277.07)
		
		var marklineupy = (homeposition.y - Maxballyup) # the line for y axis up
		var marklinedowny = (homeposition.y - Maxballydown)
		
		# y-axis................................................................
		if role == "GK" :
			#up.................................................................
			if differentiator.y <= -10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklineupy)/marklineupy)) * (homeposition.y - mpUP.y) * 0.5)
			# down..............................................................
			elif differentiator.y >= 10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklinedowny)/marklinedowny)) * (homeposition.y - mpDOWN.y) * 0.5)

		elif role == "CMF" :
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.2) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklineupy)/marklineupy)) * (homeposition.y - mpUP.y) * 0.4)
		
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
			if differentiator.y < -10:
				if differentiator.y <= (homeposition.y - centerpos.y):
					movetoposition.y = homeposition.y - ((homeposition.y - ((-differentiator.y/(homeposition.y - centerpos.y)) * (homeposition.y - centerpos.y))) * (1 - touchline))
		
		elif role =="LWF":
			if differentiator.y >= 10:
				if differentiator.y < -(homeposition.y - centerpos.y):
					movetoposition.y = (((differentiator.y/-(homeposition.y - centerpos.y)) * -(homeposition.y - centerpos.y) + homeposition.y) * (1 - touchline)) + homeposition.y
			
	
	#..................................................................................................
	
	elif awayside:
		# x-axis................................................................
		if differentiator.x <= -10 :
			movetoposition.x = (differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x
			if role == "GK":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * AlinebiasGK
				if movetoposition.x >= homeposition.x:
					movetoposition.x = homeposition.x
			elif role == "CB":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * AlinebiasCB
				if movetoposition.x >= homeposition.x:
					movetoposition.x = homeposition.x
			elif role == "CDM":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * AlinebiasCDM
				if movetoposition.x >= homeposition.x:
					movetoposition.x = homeposition.x
			elif role == "CMF":
				movetoposition.x = ((differentiator.x * ((pressureBias + defenseLine)/2)) + homeposition.x) * AlinebiasCMF
				if movetoposition.x >= homeposition.x:
					movetoposition.x = homeposition.x
		
		# defense...............................................................
		
		elif differentiator.x >= 10:
			if role == "CMF" or role == "AMF":
				movetoposition.x = (-(differentiator.x/ AMaxballx) * ((hCDMpos.x + 10) - homeposition.x) * 0.3) * defenseBias + homeposition.x
			elif role == "CB" or role == "RB" or role == "LB" or role == "CDM" or role == "GK":
				movetoposition.x = homeposition.x
			elif role == "LWF" or role == "RWF" or role == "LMF" or role == "RMF":
				movetoposition.x = (-(differentiator.x/ AMaxballx) * ((hCBpos.x  + 50) - homeposition.x) * 0.7) * defenseBias + homeposition.x 
			elif role == "CF":
				movetoposition.x = (-(differentiator.x/ AMaxballx) * ((hCBpos.x  + 50) - homeposition.x) * 0.3) * defenseBias + homeposition.x
		
		var mpUP = Vector2(125.127,99.781)
		var mpDOWN = Vector2(125.127,277.07)
		
		var marklineupy = (homeposition.y - Maxballyup) # the line for y axis up
		var marklinedowny = (homeposition.y - Maxballydown)
		
		# y-axis................................................................
		if role == "GK" :
			#up.................................................................
			if differentiator.y <= -10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklineupy)/marklineupy)) * (homeposition.y - mpUP.y) * 0.5)
			# down..............................................................
			elif differentiator.y >= 10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklinedowny)/marklinedowny)) * (homeposition.y - mpDOWN.y) * 0.5)

		elif role == "CMF" :
			if differentiator.y >= 10:
				movetoposition.y = ((((mpDOWN.y - homeposition.y)/differentiator.y) * differentiator.y ) * 0.2) + homeposition.y
			elif differentiator.y <= -10:
				movetoposition.y = homeposition.y - ((1 - ((differentiator.y + marklineupy)/marklineupy)) * (homeposition.y - mpUP.y) * 0.4)
		
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
			if differentiator.y >= 10:
				if differentiator.y < -(homeposition.y - centerpos.y):
					movetoposition.y = (((differentiator.y/-(homeposition.y - centerpos.y)) * -(homeposition.y - centerpos.y) + homeposition.y) * (1 - touchline)) + homeposition.y
		
		elif role =="LWF":
			if differentiator.y < -10:
				if differentiator.y <= (homeposition.y - centerpos.y):
					movetoposition.y = homeposition.y - ((homeposition.y - ((-differentiator.y/(homeposition.y - centerpos.y)) * (homeposition.y - centerpos.y))) * (1 - touchline))
	
	return movetoposition


func ballpassed(passer,object):
	if self == passer:
		ballholder = false
		pass
	elif self == object:
		ballholder = true
		pass
	pass

<<<<<<< HEAD
#func press():
#	if WorldSpace.closestToPress() == self:
#		press = true
#
=======
func press():
	if WorldSpace.closestToPress() == self:
		press = true

>>>>>>> cd3bdc3164f2d96797ac4f38e9add5d70e4475d3


