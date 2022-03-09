extends KinematicBody2D
class_name Player

signal player_health_changed(new_health)
signal died

export (int) var speed = 100

var velocity = Vector2.ZERO

onready var sprite = $AnimatedSprite
onready var health_stat = $Health

func _ready() -> void:
#	weapon_manager = $WeaponManager
	pass

func _process(_delta):
	
	velocity = Vector2.ZERO

	get_input()
	velocity = move_and_slide(velocity)
	
	
	if velocity == Vector2.ZERO:
		sprite.play("idle")


func get_input():

	if Input.is_action_pressed('move_right'):
		velocity.x += 1
		sprite.play("move_right")
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
		sprite.play("move_left")
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
		##sprite.play("move_down")
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
		sprite.play("move_up")
		
	velocity = velocity.normalized() * speed


func handle_hit():
	print("Player Hit!")
	
	health_stat.health -= 20
	emit_signal("player_health_changed", health_stat.health)
	if health_stat.health <= 0:
		die()


func die():
	print("Player Died!")
	emit_signal("died")
	queue_free()

