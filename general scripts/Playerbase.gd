extends Node

var homePlayerPositions: Dictionary
var awayPlayerPositions: Dictionary

var array:Array

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

func setHomepositions(playerarray):
	gethomeplayernum(playerarray)
	for x in playerarray:
		if x.role == "GK":
			x.global_position = homePlayerPositions["GK"]
		if x.role == "CB":
			if CB ==3:
				x.global_position = homePlayerPositions["CB"]
			elif CB == 2:
				hplayersCBArray[0].global_position = homePlayerPositions["CB"] + Vector2(0,-playerdistance)
				if hplayersCBArray.size() == 2:
					hplayersCBArray[1].global_position = homePlayerPositions["CB"] + Vector2(0,playerdistance)
			elif CB == 1:
				hplayersCBArray[0].global_position = homePlayerPositions["CB"]
		if x.role == "RB":
			x.global_position = homePlayerPositions["RB"]
		if x.role == "LB":
			x.global_position = homePlayerPositions["LB"]
		if x.role == "LMF":
			x.global_position = homePlayerPositions["LMF"]
		if x.role == "RMF":
			x.global_position = homePlayerPositions["RMF"]
		if x.role == "RWF":
			x.global_position = homePlayerPositions["RWF"]
		if x.role == "LWF":
			x.global_position = homePlayerPositions["LWF"]
		if x.role == "CDM":
			if CDM ==3:
				x.global_position = homePlayerPositions["CDM"]
			elif CDM == 2:
				hplayersCDMArray[0].global_position = homePlayerPositions["CDM"] + Vector2(0,-playerdistance)
				if hplayersCDMArray.size() == 2:
					hplayersCDMArray[1].global_position = homePlayerPositions["CDM"] + Vector2(0,playerdistance)
			elif CDM == 1:
				hplayersCDMArray[0].global_position = homePlayerPositions["CDM"]
		if x.role == "CMF":
			if CMF ==3:
				x.global_position = homePlayerPositions["CMF"]
			elif CMF == 2:
				hplayersCMFArray[0].global_position = homePlayerPositions["CMF"] + Vector2(0,-playerdistance)
				if hplayersCMFArray.size() == 2:
					hplayersCMFArray[1].global_position = homePlayerPositions["CMF"] + Vector2(0,playerdistance)
			elif CMF == 1:
				hplayersCMFArray[0].global_position = homePlayerPositions["CMF"]
		if x.role == "AMF":
			if AMF ==3:
				x.global_position = homePlayerPositions["AMF"]
			elif AMF == 2:
				hplayersAMFArray[0].global_position = homePlayerPositions["AMF"] + Vector2(0,-playerdistance)
				if hplayersAMFArray.size() == 2:
					hplayersAMFArray[1].global_position = homePlayerPositions["AMF"] + Vector2(0,playerdistance)
			elif AMF == 1:
				hplayersAMFArray[0].global_position = homePlayerPositions["AMF"]
		if x.role == "CF":
			if CF ==3:
				x.global_position = homePlayerPositions["CF"]
			elif CF == 2:
				hplayersCFArray[0].global_position = homePlayerPositions["CF"] + Vector2(0,-playerdistance)
				if hplayersCFArray.size() == 2:
					hplayersCFArray[1].global_position = homePlayerPositions["CF"] + Vector2(0,playerdistance)
			elif CF == 1:
				hplayersCFArray[0].global_position = homePlayerPositions["CF"]
		if x.role == "SS":
			if SS ==3:
				x.global_position = homePlayerPositions["CF"] + Vector2(-playerdistance,0)
			elif SS == 2:
				hplayersSSArray[0].global_position = homePlayerPositions["CF"] + Vector2(0,-playerdistance)
				if hplayersSSArray.size() == 2:
					hplayersSSArray[1].global_position = homePlayerPositions["CF"] + Vector2(0,playerdistance)
			elif SS == 1:
				hplayersSSArray[0].global_position = homePlayerPositions["CF"]
		pass

func setAwaypositions(playerarray):
	getawayplayernum(playerarray)
	for x in playerarray:
		if x.role == "GK":
			x.global_position = awayPlayerPositions["GK"]
		if x.role == "CB":
			if awayCB ==3:
				x.global_position = awayPlayerPositions["CB"]
			elif awayCB == 2:
				aplayersCBArray[0].global_position = awayPlayerPositions["CB"] + Vector2(0,-playerdistance)
				if aplayersCBArray.size() == 2:
					aplayersCBArray[1].global_position = awayPlayerPositions["CB"] + Vector2(0,playerdistance)
			elif awayCB == 1:
				aplayersCBArray[0].global_position = awayPlayerPositions["CB"]
		if x.role == "RB":
			x.global_position = awayPlayerPositions["RB"]
		if x.role == "LB":
			x.global_position = awayPlayerPositions["LB"]
		if x.role == "LMF":
			x.global_position = awayPlayerPositions["LMF"]
		if x.role == "RMF":
			x.global_position = awayPlayerPositions["RMF"]
		if x.role == "RWF":
			x.global_position = awayPlayerPositions["RWF"]
		if x.role == "LWF":
			x.global_position = awayPlayerPositions["LWF"]
		if x.role == "CDM":
			if awayCDM ==3:
				x.global_position = awayPlayerPositions["CDM"]
			elif awayCDM == 2:
				aplayersCDMArray[0].global_position = awayPlayerPositions["CDM"] + Vector2(0,-playerdistance)
				if aplayersCDMArray.size() == 2:
					aplayersCDMArray[1].global_position = awayPlayerPositions["CDM"] + Vector2(0,playerdistance)
			elif awayCDM == 1:
				aplayersCDMArray[0].global_position = awayPlayerPositions["CDM"]
		if x.role == "CMF":
			if awayCMF ==3:
				x.global_position = awayPlayerPositions["CMF"]
			elif awayCMF == 2:
				aplayersCMFArray[0].global_position = awayPlayerPositions["CMF"] + Vector2(0,-playerdistance)
				if aplayersCMFArray.size() == 2:
					aplayersCMFArray[1].global_position = awayPlayerPositions["CMF"] + Vector2(0,playerdistance)
			elif awayCMF == 1:
				aplayersCFArray[0].global_position = awayPlayerPositions["CMF"]
		if x.role == "AMF":
			if awayAMF ==3:
				aplayersAMFArray[0].global_position = awayPlayerPositions["AMF"]
			elif awayAMF == 2:
				aplayersAMFArray[0].global_position = awayPlayerPositions["AMF"] + Vector2(0,-playerdistance)
				if aplayersAMFArray.size() == 2:
					aplayersAMFArray[1].global_position = awayPlayerPositions["AMF"] + Vector2(0,playerdistance)
			elif awayAMF == 1:
				aplayersAMFArray[0].global_position = awayPlayerPositions["AMF"]
		if x.role == "CF":
			if awayCF ==3:
				x.global_position = awayPlayerPositions["CF"]
			elif awayCF == 2:
				aplayersCFArray[0].global_position = awayPlayerPositions["CF"] + Vector2(0,-playerdistance)
				if aplayersCFArray.size() == 2:
					aplayersCFArray[1].global_position = awayPlayerPositions["CF"] + Vector2(0,playerdistance)
			elif awayCF == 1:
				aplayersCFArray[0].global_position = awayPlayerPositions["CF"]
		if x.role == "SS":
			if awayCF ==3:
				x.global_position = awayPlayerPositions["CF"] + Vector2(-playerdistance,0)
			elif awaySS == 2:
				aplayersSSArray[0].global_position = awayPlayerPositions["CF"] + Vector2(0,-playerdistance)
				if aplayersSSArray.size() == 2:
					aplayersSSArray[1].global_position = awayPlayerPositions["CF"] + Vector2(0,playerdistance)
			elif awaySS == 1:
				aplayersSSArray[0].global_position = awayPlayerPositions["CF"]

func gethomeplayernum(playerarray):
	for x in playerarray:
		if x.role == "CB":
			if CB == 0:
				CB += 1
				hplayersCBArray.append(x)
			elif CB == 1:
				CB += 1
				hplayersCBArray.append(x)
		if x.role == "CDM":
			if CDM == 0:
				CDM += 1
				hplayersCDMArray.append(x)
			elif CDM == 1:
				CDM += 1
				hplayersCDMArray.append(x)
		if x.role == "CMF":
			if CMF == 0:
				CMF += 1
				hplayersCMFArray.append(x)
			elif CMF == 1:
				CMF += 1
				hplayersCMFArray.append(x)
		if x.role == "AMF":
			if AMF == 0:
				AMF += 1
				hplayersAMFArray.append(x)
			elif AMF == 1:
				AMF += 1
				hplayersAMFArray.append(x)
		if x.role == "CF":
			if CF == 0:
				CF += 1
				hplayersCFArray.append(x)
			elif CF == 1:
				CF += 1
				hplayersCFArray.append(x)
		if x.role == "SS":
			if CF == 0:
				CF += 1
				hplayersSSArray.append(x)
			elif CF == 1:
				CF += 1
				hplayersSSArray.append(x)

func getawayplayernum(playerarray):
	for x in playerarray:
		if x.role == "CB":
			if awayCB == 0:
				CB += 1
				aplayersCBArray.append(x)
			elif awayCB == 1:
				awayCB += 1
				aplayersCBArray.append(x)
		if x.role == "CDM":
			if awayCDM == 0:
				awayCDM += 1
				aplayersCDMArray.append(x)
			elif awayCDM == 1:
				awayCDM += 1
				aplayersCDMArray.append(x)
		if x.role == "CMF":
			if awayCMF == 0:
				awayCMF += 1
				aplayersCMFArray.append(x)
			elif awayCMF == 1:
				awayCMF += 1
				aplayersCMFArray.append(x)
		if x.role == "AMF":
			if awayAMF == 0:
				awayAMF += 1
				aplayersAMFArray.append(x)
			elif awayAMF == 1:
				awayAMF += 1
				aplayersAMFArray.append(x)
		if x.role == "CF":
			if awayCF == 0:
				awayCF += 1
				aplayersCFArray.append(x)
			elif awayCF == 1:
				awayCF += 1
				aplayersCFArray.append(x)
		if x.role == "SS":
			if awayCF == 0:
				awayCF += 1
				aplayersSSArray.append(x)
			elif awayCF == 1:
				awayCF += 1
				aplayersSSArray.append(x)









