extends Label


export var speed : float = 14



func _ready():
	self.set_global_position(Vector2.ZERO)


func _process(delta):
	var position = self.get_global_position()
	position.y -= speed * delta
	self.set_global_position(position)
