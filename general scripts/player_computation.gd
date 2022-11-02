extends Node


var linebiasGK:float = 0.6
var linebiasCB:float = 0.8
var linebiasCDM:float = 0.9
var linebiasCMF:float = 0.95
var defensivebias:float = 0.5

var hCBpos = Playerbase.hCBposition
var hCDMpos = Playerbase.hCDMposition
var aCBpos = Playerbase.aCBposition
var aCDMpos = Playerbase.aCDMposition


func calculate_Move_Position(homeposition, ballpos,homeside,role,pressureBias):
	
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

