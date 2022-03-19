extends Area2D
class_name Lazer


#export (int) var speed = 2

onready var sprite = $Sprite/AnimationPlayer
onready var collision = $CollisionShape2D
onready var kill_timer = $LazerTimer


var direction = Vector2.ZERO


func _ready() -> void:
	kill_timer.start()


func _physics_process(_delta):
	
	if sprite.current_animation == "lazer_shoot":
		collision.set_deferred("Disabled", false)
	else:
		collision.set_deferred("Disabled", true)


func set_direction(direction):
	self.direction = direction
	rotation += direction.angle()


func _on_LazerTimer_timeout() -> void:
	print("KillTimer expired")
	queue_free()


func _on_Lazer_body_entered(body: Node) -> void:
	if body.name == "Player":
		print("Lazer hit something!")
#		GlobalSignals.emit_signal("bullet_impacted", body.global_position, direction)
		body.handle_hit()
		queue_free()
