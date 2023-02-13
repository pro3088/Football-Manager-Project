extends Node

class_name Tactics

enum attackstyle{ #style of attacking play
	counter
	possession
}

enum positioning{ # do players fill the spaces
	maintain
	flexible
}

enum marking{
	manToMan
	conservative
}

var atk
var teamPos
var teamMark

var pitchWidth:float = 0.1 #width of the center line of the pitch #horizontal
var defenseWidth:float = 0.1 #width of the defense (of each player) between counter 

var touchline:float = 0.1

var defenseLine:float = 0.1 #length from the center line of the pitch #vertical

var pressurebias: float = 0.3
var defensebias: float = 0.1

var supportRange:float = 0.1  #distance between players

var avgTeamAtkBias:float = 0.5










