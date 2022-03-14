extends Node2D
class_name Slash

onready var sprite = $Sprite
onready var kill_timer = $KillTimer
onready var direction = Vector2.ZERO
onready var player = Vector2.ZERO


func _ready():
	print("Player Slashed!")
	set_direction(get_global_mouse_position())
	kill_timer.start()


func set_direction(direction):
	rotation = direction.angle()


func _on_KillTimer_timeout() -> void:
	print("KillTimer expired")
	queue_free()


#func _on_Bullet_body_entered(body: Node) -> void:
#	if body.has_method("handle_hit"):
#		print("Bullet hit something!")
##		GlobalSignals.emit_signal("bullet_impacted", body.global_position, direction)
#		body.handle_hit()


func _on_Slash_body_entered(body):
	if body.name == "Monster":
		body.queue_free()
		kill_timer.stop()
