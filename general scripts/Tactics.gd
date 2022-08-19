extends Node

var touchline = 0.8 # distance between wingers and the touchline

var defenseLine:float = 0.4 #Length from the center line of the pitch #vertical

var pressurebias: float = 0.3
var defensebias: float = 0.1

var supportRange:float = 0.1  #Distance between players

var avgTeamAtkBias:float = 0.5

enum attackstyle{ #Style of attacking play
	counter
	possession
}

enum positioning{
	maintain
	flexible
}

enum marking{
	manToMan
	conservative
}











