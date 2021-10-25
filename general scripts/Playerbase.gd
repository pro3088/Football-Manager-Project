extends Node

var homePlayerPositions: Dictionary
var awayPlayerPositions: Dictionary

var homekickoff: bool
var awaykickoff: bool

var Kickoffplayer

var array:Array

var playerposition : Vector2 

var playerdistance = 50

var CB: int = 0
var CDM: int = 0
var CMF: int = 0
var AMF: int = 0
var SS: int = 0
var CF: int = 0

var hplayersCBArray:Array
var hplayersCDMArray:Array
var hplayersCMFArray:Array
var hplayersAMFArray:Array
var hplayersSSArray:Array
var hplayersCFArray:Array

var aplayersCBArray:Array
var aplayersCDMArray:Array
var aplayersCMFArray:Array
var aplayersAMFArray:Array
var aplayersSSArray:Array
var aplayersCFArray:Array

var awayCB: int = 0
var awayCDM: int = 0
var awayCMF: int = 0
var awayAMF: int = 0
var awaySS: int = 0
var awayCF: int = 0



func setHomePlayers(playerarray):
	var number = Team.TeamNum
	var no = 1
	var playerdata
	Database.arrayforplayers(number)
	for x in playerarray:
		playerdata = Database.playerinfoarray[no]
		x.role = playerdata["role"]
		x.attackStat = playerdata["attack"]
		x.Name = playerdata["name"]
		x.crossStat = playerdata["cross"]
		x.passStat = playerdata["pass"]
		x.age = playerdata["age"]
		x.defenceStat = playerdata["defence"]
		x.form = playerdata["form"]
		x.physique = playerdata["physique"]
		x.country = playerdata["country"]
		no += 1

func setAwayPlayers(playerarray):
	var number = Team.TeamNum
	var no = 1
	var playerdata
	Database.arrayforplayers(number)
	for x in playerarray:
		playerdata = Database.playerinfoarray[no]
		x.role = playerdata["role"]
		x.attackStat = playerdata["attack"]
		x.Name = playerdata["name"]
		x.crossStat = playerdata["cross"]
		x.passStat = playerdata["pass"]
		x.age = playerdata["age"]
		x.defenceStat = playerdata["defence"]
		x.form = playerdata["form"]
		x.physique = playerdata["physique"]
		x.country = playerdata["country"]
		no += 1


func setAwaypositions(playerarray):
	getawayplayernum(playerarray)
	for x in playerarray:
		if x.role == "GK":
			x.homeposition = awayPlayerPositions["GK"]
			x.global_position = x.homeposition
		if x.role == "CB":
			if awayCB ==3:
				x.homeposition = awayPlayerPositions["CB"]
				x.global_position = x.homeposition
			elif awayCB == 2:
				x.homeposition = awayPlayerPositions["CB"] + Vector2(0,-playerdistance)
				aplayersCBArray[0].global_position = x.homeposition
				if aplayersCBArray.size() == 2:
					x.homeposition = awayPlayerPositions["CB"] + Vector2(0,playerdistance)
					aplayersCBArray[1].global_position = x.homeposition
			elif awayCB == 1:
				x.homeposition = awayPlayerPositions["CB"]
				aplayersCBArray[0].global_position = x.homeposition
		if x.role == "RB":
			x.homeposition = awayPlayerPositions["RB"]
			x.global_position = x.homeposition
		if x.role == "LB":
			x.homeposition = awayPlayerPositions["LB"]
			x.global_position = x.homeposition
		if x.role == "LMF":
			x.homeposition = awayPlayerPositions["LMF"]
			x.global_position = x.homeposition
		if x.role == "RMF":
			x.homeposition = awayPlayerPositions["RMF"]
			x.global_position = x.homeposition
		if x.role == "RWF":
			x.homeposition = awayPlayerPositions["RWF"]
			x.global_position = x.homeposition
		if x.role == "LWF":
			x.homeposition = awayPlayerPositions["LWF"]
			x.global_position = x.homeposition
		if x.role == "CDM":
			if awayCDM == 3:
				x.homeposition = awayPlayerPositions["CDM"]
				x.global_position = x.homeposition
			elif awayCDM == 2:
				x.homeposition = awayPlayerPositions["CDM"] + Vector2(0,-playerdistance)
				aplayersCDMArray[0].global_position = x.homeposition
				if aplayersCDMArray.size() == 2:
					x.homeposition = awayPlayerPositions["CDM"] + Vector2(0,playerdistance)
					aplayersCDMArray[1].global_position = x.homeposition
			elif awayCDM == 1:
				x.homeposition = awayPlayerPositions["CDM"]
				aplayersCDMArray[0].global_position = x.homeposition
		if x.role == "CMF":
			if awayCMF ==3:
				x.homeposition = awayPlayerPositions["CMF"]
				x.global_position = x.homeposition
			elif awayCMF == 2:
				x.homeposition = awayPlayerPositions["CMF"] + Vector2(0,-playerdistance)
				aplayersCMFArray[0].global_position = x.homeposition
				if aplayersCMFArray.size() == 2:
					x.homeposition = awayPlayerPositions["CMF"] + Vector2(0,playerdistance)
					aplayersCMFArray[1].global_position = x.homeposition
			elif awayCMF == 1:
				x.homeposition = awayPlayerPositions["CMF"]
				aplayersCFArray[0].global_position = x.homeposition
		if x.role == "AMF":
			if awayAMF ==3:
				x.homeposition = awayPlayerPositions["AMF"]
				aplayersAMFArray[0].global_position = x.homeposition
			elif awayAMF == 2:
				x.homeposition = awayPlayerPositions["AMF"] + Vector2(0,-playerdistance)
				aplayersAMFArray[0].global_position = x.homeposition
				if aplayersAMFArray.size() == 2:
					x.homeposition = awayPlayerPositions["AMF"] + Vector2(0,playerdistance)
					aplayersAMFArray[1].global_position = x.homeposition
			elif awayAMF == 1:
				x.homeposition = awayPlayerPositions["AMF"]
				aplayersAMFArray[0].global_position = x.homeposition
		if x.role == "CF":
			if awayCF ==3:
				x.homeposition = awayPlayerPositions["CF"]
				x.global_position = x.homeposition
			elif awayCF == 2:
				x.homeposition = awayPlayerPositions["CF"] + Vector2(0,-playerdistance)
				aplayersCFArray[0].global_position = x.homeposition
				if aplayersCFArray.size() == 2:
					x.homeposition = awayPlayerPositions["CF"] + Vector2(0,playerdistance)
					aplayersCFArray[1].global_position = x.homeposition
			elif awayCF == 1:
				x.homeposition = awayPlayerPositions["CF"]
				aplayersCFArray[0].global_position = x.homeposition
		if x.role == "SS":
			if awayCF ==3:
				x.homeposition = awayPlayerPositions["CF"] + Vector2(-playerdistance,0)
				x.global_position = x.homeposition
			elif awaySS == 2:
				x.homeposition = awayPlayerPositions["CF"] + Vector2(0,-playerdistance)
				aplayersSSArray[0].global_position = x.homeposition
				if aplayersSSArray.size() == 2:
					x.homeposition = awayPlayerPositions["CF"] + Vector2(0,playerdistance)
					aplayersSSArray[1].global_position = x.homeposition
			elif awaySS == 1:
				x.homeposition = awayPlayerPositions["CF"]
				aplayersSSArray[0].global_position = x.homeposition


func setHomepositions(playerarray):
	gethomeplayernum(playerarray)
	for x in playerarray:
		if x.role == "GK":
			x.homeposition = homePlayerPositions["GK"]
			x.global_position = x.homeposition
		if x.role == "CB":
			if CB ==3:
				x.homeposition = homePlayerPositions["CB"]
				x.global_position = x.home.position
			elif CB == 2:
				x.homeposition = homePlayerPositions["CB"] + Vector2(0,-playerdistance)
				hplayersCBArray[0].global_position = x.homeposition
				if hplayersCBArray.size() == 2:
					x.homeposition = homePlayerPositions["CB"] + Vector2(0,playerdistance)
					hplayersCBArray[1].global_position = x.homeposition
			elif CB == 1:
				x.homeposition = homePlayerPositions["CB"]
				hplayersCBArray[0].global_position = x.homeposition
		if x.role == "RB":
			x.homeposition= homePlayerPositions["RB"]
			x.global_position = x.homeposition
		if x.role == "LB":
			x.homeposition = homePlayerPositions["LB"]
			x.global_position = x.homeposition
		if x.role == "LMF":
			x.homeposition = homePlayerPositions["LMF"]
			x.global_position = x.homeposition
		if x.role == "RMF":
			x.homeposition = homePlayerPositions["RMF"]
			x.global_position = x.homeposition
		if x.role == "RWF":
			x.homeposition = homePlayerPositions["RWF"]
			x.global_position = x.homeposition
		if x.role == "LWF":
			x.homeposition = homePlayerPositions["LWF"]
			x.global_position = x.homeposition
		if x.role == "CDM":
			if CDM == 3:
				x.homeposition = homePlayerPositions["CDM"]
				x.global_position = x.homeposition
			elif CDM == 2:
				x.homeposition = homePlayerPositions["CDM"] + Vector2(0,-playerdistance)
				hplayersCDMArray[0].global_position = x.homeposition
				if hplayersCDMArray.size() == 2:
					x.homeposition = homePlayerPositions["CDM"] + Vector2(0,playerdistance)
					hplayersCDMArray[1].global_position = x.homeposition
			elif CDM == 1:
				x.homeposition = homePlayerPositions["CDM"]
				hplayersCDMArray[0].global_position = x.homeposition
				pass
		if x.role == "CMF":
			if CMF ==3:
				x.homeposition = homePlayerPositions["CMF"]
				x.global_position = x.homeposition
			elif CMF == 2:
				x.homeposition = homePlayerPositions["CMF"] + Vector2(0,-playerdistance)
				hplayersCMFArray[0].global_position = x.homeposition
				print(x,x.role,"0",hplayersCMFArray[0].global_position)
				if hplayersCMFArray.size() == 2:
					x.homeposition = homePlayerPositions["CMF"] + Vector2(0,playerdistance)
					hplayersCMFArray[1].global_position = x.homeposition
					print(x,x.role,"1",hplayersCMFArray[1].global_position)
			elif CMF == 1:
				x.homeposition = homePlayerPositions["CMF"]
				hplayersCMFArray[0].global_position = x.homeposition
		if x.role == "AMF":
			if AMF ==3:
				x.homeposition = homePlayerPositions["AMF"]
				x.global_position = x.homeposition
			elif AMF == 2:
				x.homeposition = homePlayerPositions["AMF"] + Vector2(0,-playerdistance)
				hplayersAMFArray[0].global_position = x.homeposition
				if hplayersAMFArray.size() == 2:
					x.homeposition = homePlayerPositions["AMF"] + Vector2(0,playerdistance)
					hplayersAMFArray[1].global_position = x.homeposition
			elif AMF == 1:
				x.homeposition = homePlayerPositions["AMF"]
				hplayersAMFArray[0].global_position = x.homeposition
		if x.role == "CF":
			if CF ==3:
				x.homeposition = homePlayerPositions["CF"]
				x.global_position = x.homeposition
			elif CF == 2:
				x.homeposition = homePlayerPositions["CF"] + Vector2(0,-playerdistance)
				hplayersCFArray[0].global_position = x.homeposition
				if hplayersCFArray.size() == 2:
					x.homeposition = homePlayerPositions["CF"] + Vector2(0,playerdistance)
					hplayersCFArray[1].global_position = x.homeposition
			elif CF == 1:
				x.homeposition = homePlayerPositions["CF"]
				hplayersCFArray[0].global_position = x.homeposition
				
		if x.role == "SS":
			if SS ==3:
				x.homeposition = homePlayerPositions["CF"] + Vector2(-playerdistance,0)
				x.global_position = x.homeposition
			elif SS == 2:
				x.homeposition = homePlayerPositions["CF"] + Vector2(0,-playerdistance)
				hplayersSSArray[0].global_position = x.homeposition
				if hplayersSSArray.size() == 2:
					x.homeposition = homePlayerPositions["CF"] + Vector2(0,playerdistance)
					hplayersSSArray[1].global_position = x.homeposition
			elif SS == 1:
				x.homeposition = homePlayerPositions["CF"]
				hplayersSSArray[0].global_position = x.homeposition
		pass

func gethomeplayernum(playerarray):
	for x in playerarray:
		if x.role == "CB":
			if CB == 0:
				CB += 1
				hplayersCBArray.append(x)
			elif CB == 1  and x != hplayersCBArray[0]:
				CB += 1
				hplayersCBArray.append(x)
		if x.role == "CDM":
			if CDM == 0:
				CDM += 1
				hplayersCDMArray.append(x)
			elif CDM == 1 and x != hplayersCDMArray[0]:
				CDM += 1
				hplayersCDMArray.append(x)
		if x.role == "CMF":
			if CMF == 0:
				CMF += 1
				hplayersCMFArray.append(x)
			elif CMF == 1 and x != hplayersCMFArray[0]:
				CMF += 1
				hplayersCMFArray.append(x)
		if x.role == "AMF":
			if AMF == 0:
				AMF += 1
				hplayersAMFArray.append(x)
			elif AMF == 1 and x != hplayersAMFArray[0]:
				AMF += 1
				hplayersAMFArray.append(x)
		if x.role == "CF":
			if CF == 0:
				CF += 1
				hplayersCFArray.append(x)
			elif CF == 1 and x != hplayersCFArray[0]:
				CF += 1
				hplayersCFArray.append(x)
		if x.role == "SS":
			if CF == 0:
				CF += 1
				hplayersSSArray.append(x)
			elif CF == 1 and x != hplayersSSArray[0]:
				CF += 1
				hplayersSSArray.append(x)

func getawayplayernum(playerarray):
	for x in playerarray:
		if x.role == "CB":
			if awayCB == 0:
				awayCB += 1
				aplayersCBArray.append(x)
			elif awayCB == 1 and x != aplayersCBArray[0]:
				awayCB += 1
				aplayersCBArray.append(x)
		if x.role == "CDM":
			if awayCDM == 0:
				awayCDM += 1
				aplayersCDMArray.append(x)
			elif awayCDM == 1 and x != aplayersCDMArray[0]:
				awayCDM += 1
				aplayersCDMArray.append(x)
		if x.role == "CMF":
			if awayCMF == 0:
				awayCMF += 1
				aplayersCMFArray.append(x)
			elif awayCMF == 1 and x != aplayersCMFArray[0]:
				awayCMF += 1
				aplayersCMFArray.append(x)
		if x.role == "AMF":
			if awayAMF == 0:
				awayAMF += 1
				aplayersAMFArray.append(x)
			elif awayAMF == 1 and x != aplayersAMFArray[0]:
				awayAMF += 1
				aplayersAMFArray.append(x)
		if x.role == "CF":
			if awayCF == 0:
				awayCF += 1
				aplayersCFArray.append(x)
			elif awayCF == 1 and x != aplayersCFArray[0]:
				awayCF += 1
				aplayersCFArray.append(x)
		if x.role == "SS":
			if awayCF == 0:
				awayCF += 1
				aplayersSSArray.append(x)
			elif awayCF == 1 and x != aplayersSSArray[0]:
				awayCF += 1
				aplayersSSArray.append(x)



func setkickoff():
	var training = WorldSpace.training
	if !MatchPlay.matchstart and hplayersCFArray.size() > 0 and !training:
		hplayersCFArray[0].global_position = homePlayerPositions["kickoff"]
		Kickoffplayer = hplayersCFArray[0]
	elif !MatchPlay.matchstart and hplayersSSArray.size() > 0 and !training:
		hplayersSSArray[0].global_position = homePlayerPositions["kickoff"]
		Kickoffplayer = hplayersSSArray[0]
		pass
	pass
	
func restartplay():
	var training = WorldSpace.training
	if MatchPlay.restarthomeplay and hplayersCFArray.size() > 0 and !training:
		hplayersCFArray[0].global_position = homePlayerPositions["kickoff"]
		Kickoffplayer = hplayersCFArray[0]
		MatchPlay.restarthomeplay = false
	elif MatchPlay.restarthomeplay and hplayersSSArray.size() > 0 and !training:
		hplayersSSArray[0].global_position = homePlayerPositions["kickoff"]
		Kickoffplayer = hplayersSSArray[0]
		MatchPlay.restarthomeplay = false
	if MatchPlay.restartawayplay and aplayersCFArray.size() > 0 and !training:
		aplayersCFArray[0].global_position = awayPlayerPositions["kickoff"]
		Kickoffplayer = aplayersCFArray[0]
		MatchPlay.restartawayplay = false
	elif MatchPlay.restartawayplay and aplayersSSArray.size() > 0 and !training:
		hplayersCFArray[0].global_position = awayPlayerPositions["kickoff"]
		Kickoffplayer = aplayersSSArray[0]
		MatchPlay.restartawayplay = false
	pass






