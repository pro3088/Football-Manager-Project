extends Container

onready var messageBox = $"message box"

func _ready():
	messageBox.rect_size.x = 905
	messageBox.rect_size.y = 120
	messageBox.rect_position.x = (926-905)/2
	

