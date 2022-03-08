extends Label


export var speed : float = 9.5
export var limit : int = 200

func _ready():
	self.set_global_position(Vector2.ZERO)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var position = self.get_global_position()
	position.y -= speed * delta
	position = self.set_global_position(position)

