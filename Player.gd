extends KinematicBody2D
class_name Player


signal player_health_changed(new_health)
signal died

export (PackedScene) var Slash

export (int) var speed = 100
export (bool) var isMoving

var velocity = Vector2.ZERO
var look = Position2D

onready var sprite = $AnimatedSprite
onready var health_stat = $Health
onready var attack_point = $Slash
onready var attack_cooldown = $AttackCooldown

#onready var walkStep = $SFX/Walk


func _process(_delta):	
	
#	if isMoving :
#		walkStep.play()

	velocity = Vector2.ZERO
	get_input()
	velocity = move_and_slide(velocity)
	
	if velocity == Vector2.ZERO:
		sprite.play("idle")
		isMoving = false
	else:
		isMoving = true
		
	look = get_global_mouse_position()


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
		
	if Input.is_action_just_pressed("action"):
		slash()
		print("slash at")
		print(look)
		
	velocity = velocity.normalized() * speed
	
	
func slash():
	if attack_cooldown.is_stopped() and Slash != null:
		print("slash activated")
		var slash_instance = Slash.instance()
		add_child(slash_instance)
#		slash_instance.direction = (attack_point.global_position - global_position).normalized()
		attack_cooldown.start()


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



func _on_AttackCooldown_timeout():
	attack_cooldown.stop()
