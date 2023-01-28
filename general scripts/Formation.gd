extends Node

var formation = "F433"

var topEleven:Dictionary

var rb = 1
var lb = 1
var cb = 2
var cdm = 1
var cmf = 2
var lmf = 0
var rmf = 0
var amf = 0
var lwf = 1
var rwf = 1
var ss= 0
var cf = 1

enum formations {
	F433
	F442
	F4231
	F442
	F334
	F343
	F4321
	F4312
	F532
	F541
}

func setRoleNumber():
	print("Getting formation role number ")
	match formation :
		formations.F442:
			pass
		_:
			rb = 1
			lb = 1
			cb = 2
			cdm = 1
			cmf = 2
			lmf = 0
			rmf = 0
			amf = 0
			lwf = 1
			rwf = 1
			ss = 0
			cf = 1
	var total = 1 + cb + lb + rb + cdm + cmf + lmf + rmf + amf + lwf + rwf + ss + cf
	if total < 11 or total > 11:
		printerr("Number of Players doesn't correspond")
	print("Roles have been set")


func getTopEleven():
	topEleven["GK"] = Team.topRolePlayers.get("GK")
