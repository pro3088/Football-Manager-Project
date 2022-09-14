<<<<<<< HEAD
tool
extends SpinBox

func can_drop_data(position, data):
	# this prevents locking the mouse
	# on some operating systems
	# due to a godot editor bug with SpinBox drag/drop
	return false
=======
tool
extends SpinBox

func can_drop_data(position, data):
	# this prevents locking the mouse
	# on some operating systems
	# due to a godot editor bug with SpinBox drag/drop
	return false
>>>>>>> cd3bdc3164f2d96797ac4f38e9add5d70e4475d3
