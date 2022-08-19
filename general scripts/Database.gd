extends Node

const sqlite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db
var db_name = "res://DataStore/fm_db"

var playerinfoarray:Array

func _ready():
	if OS.get_name() in ["Windows"] or OS.get_name() in ["Android"]:
		copyPath()
		db_name = "user://fm_db"
	pass

func copyPath():
	var dir = Directory.new()
	dir.copy("res://DataStore/fm_db.db", "user://fm_db.db")
	pass

# get players from database
func getplayersinfo(id:int):
	var dict: Dictionary
	db.query("SELECT Players.name, Players.age, Players.attack, Players.defence, Players.cross, Players.pass, Players.curve, Players.physique, Players.form, Role.name as role, Country.name as country FROM Players LEFT JOIN Role on Players.roleid = role.id JOIN Country on Players.countryid = Country.id WHERE Players.id = "+ str(id))
	for x in db.query_result:
		dict = x
	return dict

func arrayforplayers(number):
	db = sqlite.new()
	db.path = db_name
	db.open_db()
	for x in range(number+1):
		playerinfoarray.append(getplayersinfo(x))
	db.close_db()
