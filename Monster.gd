extends KinematicBody2D
class_name Monster

##signal died

#signal monster_fired_bullet(bullet)

export (PackedScene) var Bullet

onready var ai = $AI
onready var sprite = $Sprite/AnimationPlayer
onready var attack_cooldown = $AttackCooldown
onready var death_sfx = $SFX/death
onready var attack_sfx = $SFX/attack

export (int) var speed = 10

func _onready():
	sprite.play("idle")

##func handle_hit():
func shoot():
	if attack_cooldown.is_stopped() and Bullet != null:
		attack_sfx.play()
		var bullet_instance = Bullet.instance()
		add_child(bullet_instance)
		bullet_instance.direction = global_position.normalized()
		print("Monster took a shot!")
		
		var player = get_node("/root/Game/Player")
		var direction_to_player = bullet_instance.global_position.direction_to(player.global_position).normalized()
		bullet_instance.set_direction(direction_to_player)
		
		attack_cooldown.start()


func die():
	sprite.play("eye_die")
	death_sfx.play()
	queue_free()


func _on_HitBox_body_entered(body):
	if body.name == "Player":
		body.handle_hit()
