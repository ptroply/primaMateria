extends Position2D

onready var weapon = get_parent()

func _process(delta):
	position = get_global_mouse_position()
