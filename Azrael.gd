extends KinematicBody2D
class_name Azrael

export (PackedScene) var Lazer

onready var ai = $AngelAI
onready var sprite = $Sprite
onready var sprite_anim = $Sprite/AnimationPlayer
onready var attack_cooldown = $AttackCooldown2
onready var health_stat = $Health
onready var hit_timer = $HitTimer


func _ready():
	sprite_anim.play("New Anim")


func shoot():
	if attack_cooldown.is_stopped() and Lazer != null:
		print("Boss took a shot!")
		
		var player = get_node("/root/Game/Player")

#		attack_sfx.play()
		var lazer_instance = Lazer.instance()
		add_child(lazer_instance)
		lazer_instance.direction = global_position.normalized()
		var direction_to_player = lazer_instance.global_position.direction_to(player.global_position).normalized()
		lazer_instance.set_direction(direction_to_player)
		
		attack_cooldown.start()
		
func handle_hit():
	print("Boss Hit!")
	health_stat.health -= 10
	sprite.self_modulate = "af1010"
	print(health_stat.health)
	hit_timer.start()
	if health_stat.health <= 0:
		die()

func die():
#	sprite.play("death")
#	death_sfx.play()

	sprite.self_modulate = "af1010"	
	queue_free()


func _on_Area2DTendrils_body_entered(body):
	if body.name == "Player":
		body.handle_hit()


func _on_HitTimer_timeout():
	sprite.self_modulate = "ffffff"
