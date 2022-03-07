extends KinematicBody2D
class_name Player

export (int) var Speed = 100

var velocity = Vector2.ZERO

onready var sprite = $AnimatedSprite

func _ready() -> void:
	pass

func _process(delta:float) -> void:
	
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
	velocity = velocity.normalized() * Speed


func _unhandled_input(event: InputEvent) -> void:
#	if event.is_action_release("shoot"):
#		monster: shoot()
	pass
