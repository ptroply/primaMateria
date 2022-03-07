extends Node2D

signal state_changed(new_state)

enum State {
	PATROL,
	ENGAGE,
	ADVANCE
}




onready var player_detection_zone = $DetectionZone
onready var monster: Monster = self.get_parent()

var current_state: int = -1 setget set_state
var target: KinematicBody2D = null


func _ready() -> void:
	set_state(State.PATROL)

func _physics_process(delta: float) -> void:
	match current_state:
		State.PATROL:
			pass
		State.ENGAGE:
			if target != null and monster != null:
				monster.shoot()
			else:
				if target == null:
					print("engaged with no target")
				if monster == null:
					print("null actor engaged")

		State.ADVANCE:
			pass
		_:
			print("error: invalid state")
			

#func initialize(monster: KinematicBody2D):
#	self.monster = monster


func set_state(new_state: int):
	if new_state == current_state:
		return
	
	current_state = new_state
	emit_signal("state_changed", current_state)


func _on_DetectionZone_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		monster.attack_cooldown.start()
		set_state(State.ENGAGE)
		target = body


func _on_DetectionZone_body_exited(body: Node) -> void:
	if target and body == target:
		set_state(State.ADVANCE)
		target = null
