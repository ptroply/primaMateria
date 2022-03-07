extends KinematicBody2D
class_name Monster

##signal died

signal monster_fired_bullet(bullet)

export (PackedScene) var Bullet

onready var ai = $AI
onready var collision_shape = $CollisionShape2D
##onready var health_stat = $Health
onready var attack_cooldown = $AttackCooldown

export (int) var speed = 10

#func _ready() -> void:
#	ai.initialize(self)

##func handle_hit():
func shoot():
	if attack_cooldown.is_stopped() and Bullet != null:
		var bullet_instance = Bullet.instance()
		add_child(bullet_instance)
		bullet_instance.direction = global_position.normalized()	
		var player = get_node("/root/Game/Player")
		var direction_to_player = bullet_instance.global_position.direction_to(player.global_position).normalized()
		bullet_instance.set_direction(direction_to_player)
		attack_cooldown.start()
		print("monster shot")
	else:
		print("monster waiting to shoot")
