extends Node2D
class_name Weapon


export (PackedScene) var Slash

onready var end_of_gun = $EndOfGun
onready var attack_cooldown = $AttackCooldown


func slash():
	if attack_cooldown.is_stopped() and Slash != null:
		print("slash activated")
		var slash_instance = Slash.instance()
		add_child(slash_instance)
		var direction = (end_of_gun.global_position - global_position).normalized()
		attack_cooldown.start()
