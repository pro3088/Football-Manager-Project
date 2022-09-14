extends Node

class_name Stats

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

export(int) var speed = 100
export(String) var playerName
export(String) var country
export(int) var age
export(playerroles) var role
export(int) var attack
export(int) var dribble
export(int) var pas
export(int) var cross
export(int) var curve
export(int) var defence
export(int) var shot
export(int) var physique
export(int) var form
export(int) var stamina

#team instruction familiarity
var passBias
var playAreaBias
var formationBias 
var progressionBias
var pressureBias
var defenseBias

func _init(_name, _country, _age, _shot, _pass, _cross, _curve, _form, _ATK, _STR, _STA, _DEF, _DRI, _SPD):
	playerName = _name
	country = _country
	age = _age
	shot = _shot
	pas = _pass
	cross = _cross
	curve = _curve
	form = _form
	attack = _ATK
	physique = _STR
	stamina = _STA
	defence = _DEF
	dribble = _DRI
	speed = _SPD

func playertactics(_pressureBias = 1, _defenseBias = 1, _passBias = 5, _playAreaBias = 5, _formationBias = 5, _progressionBias = 5):
	passBias = _passBias
	playAreaBias = _playAreaBias
	formationBias = _formationBias
	progressionBias = _progressionBias
	pressureBias = _pressureBias
	defenseBias = _defenseBias
