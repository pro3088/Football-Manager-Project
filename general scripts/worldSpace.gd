extends Node

var goalDetected: bool

var matchstart:bool

var centerpos # from pitch scene

var ballResource = preload("res://world/Ball.tscn").instance()

var homegoalposition
var awaygoalposition

var training:bool = true

var ballposition setget setposition, getposition
var ballforce setget setforce, getforce

func setposition(position):
	ballposition = position

func getposition():
	return ballposition

func setforce(force):
	ballforce = force

func getforce():
	return ballforce




