extends Node

const sqlite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DataStore/fm_db"

var playerinfoarray:Array


var playerstats:Array
var clubTeam:Array


func _ready():
	if OS.get_name() in ["Windows"] or OS.get_name() in ["Android"]:
		copyPath()
		db_name = "user://fm_db"
	db = sqlite.new()
	db.path = db_name
	db.open_db()
#	getAllPlayers()
	getClubTeam()
	db.close_db()

func copyPath():
	var dir = Directory.new()
	dir.copy("res://DataStore/fm_db.db", "user://fm_db.db")

func getAllPlayers():
	db = sqlite.new()
	db.path = db_name
	db.open_db()
	db.query("SELECT Players.name, Players.age, Players.attack, Players.speed,Players.defence, Players.cross, Players.pass, Players.curve, Players.physique, Players.form, Players.stamina, Players.dribble, Players.shot, Role.name as role, Country.name as country FROM Players LEFT JOIN Role on Players.roleid = role.id JOIN Country on Players.countryid = Country.id ")
	print(" Getting Query Results ")
	print_debug(db.error_message)
	for stat in db.query_result:
		playerstats.append(preload("res://player/Player Stats.gd").new(stat.name, stat.country, stat.age, stat.role, stat.shot, stat.pass, stat.cross, stat.curve, stat.form, stat.attack, stat.physique, stat.stamina, stat.defence, stat.dribble, stat.speed))

func getClubTeam():
	db.path = db_name
	var userName = User.userName
	var teamName
	var managerName
	db.query("SELECT Players.name, Players.age, Players.attack, Players.speed,Players.defence, Players.cross, Players.pass, Players.curve, Players.physique, Players.form, Players.stamina, Players.dribble, Players.shot, Role.name as role, Country.name as country, user.club as club, user.name as manager FROM Players LEFT JOIN Role on Players.roleid = role.id JOIN Country on Players.countryid = Country.id JOIN user on Players.club = user.id WHERE manager = '" + userName + "'")
	print(" Getting Query Results for club Team ")
	print_debug(db.error_message)
	for stat in db.query_result:
		clubTeam.append(preload("res://player/Player Stats.gd").new(stat.name, stat.country, stat.age, stat.role, stat.shot, stat.pass, stat.cross, stat.curve, stat.form, stat.attack, stat.physique, stat.stamina, stat.defence, stat.dribble, stat.speed))


















