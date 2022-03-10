extends Area2D
class_name Bullet


export (int) var speed = 3

onready var sprite = $Sprite
onready var kill_timer = $KillTimer


var direction = Vector2.ZERO


func _ready() -> void:
	kill_timer.start()


func _physics_process(_delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed

		global_position += velocity


func set_direction(direction):
	self.direction = direction
	rotation += direction.angle()


func _on_KillTimer_timeout() -> void:
	print("KillTimer expired")
	queue_free()


func _on_Bullet_body_entered(body: Node) -> void:
	if body.has_method("handle_hit"):
		print("Bullet hit something!")
#		GlobalSignals.emit_signal("bullet_impacted", body.global_position, direction)
		body.handle_hit()
