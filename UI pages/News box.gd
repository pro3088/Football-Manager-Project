extends Container

onready var TitleBar = $Title
onready var messageBox = $"message box"
onready var message = $"message box/ColorRect/message"
onready var title = $Title/ColorRect/title

func _ready():
	messageBox.rect_size.x = 905
	messageBox.rect_size.y = 145
	messageBox.rect_position.x = (926-905)/2
	messageBox.rect_position.y = 14
	
	TitleBar.rect_size.x = 891
	TitleBar.rect_size.y = 28
	TitleBar.rect_position.x = (926-891)/2
	
	message.rect_position.x = 27
	message.margin_top = 40
	message.rect_size.x = 842
	message.rect_size.y = 63
	
	title.margin_left = 23
	title.margin_top = 4
	

