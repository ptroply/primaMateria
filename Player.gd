extends KinematicBody2D
class_name Player


signal player_health_changed(new_health)
signal died

export (PackedScene) var Slash

export (int) var speed = 100
export (bool) var isMoving

var velocity = Vector2.ZERO
var look = Position2D
var isAttacking : bool

onready var sprite = $AnimatedSprite
onready var health_stat = $Health
onready var attack_cooldown = $AttackCooldown

onready var walkStep = $SFX/Walk
onready var spearAttack = $SFX/SpearAttack


func _process(_delta):

	velocity = Vector2.ZERO
	get_input()
	velocity = move_and_slide(velocity)
	
	if velocity == Vector2.ZERO:
		sprite.play("idle")
		isMoving = false
		
	look = get_global_mouse_position()
	if !attack_cooldown.is_stopped():
		isAttacking = false


func get_input():
	
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
		sprite.play("move_right")
		isMoving = true
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
		sprite.play("move_left")
		isMoving = true
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
		isMoving = true
		sprite.play("move_down")
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
		sprite.play("move_up")
		isMoving = true
		

## ???
	if !isMoving:
		walkStep.play()
	
	if Input.is_action_just_pressed("action") and !isAttacking:
#		print("slash right")
#		sprite.play("slash-right")
		slash()


		
	velocity = velocity.normalized() * speed
	
	
func slash():
	if attack_cooldown.is_stopped() and Slash != null:
		var slash_instance = Slash.instance()
		add_child(slash_instance)
		print("slash at")
		print(look)
		spearAttack.play()
		isAttacking = true
		attack_cooldown.start()


func handle_hit():
	print("Player Hit!")
	
	health_stat.health -= 20
	emit_signal("player_health_changed", health_stat.health)
	if health_stat.health <= 0:
		die()


func die():
	print("Player Died!")
	get_tree().change_scene("res://GameOver.tscn")



func _on_AttackCooldown_timeout():
	attack_cooldown.stop()
