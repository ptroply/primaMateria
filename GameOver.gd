extends Node2D


onready var timer = $Timer
onready var colorRect = $ColorRect
onready var label = $Label



func _on_Player_died():
	print("Game Over!")
	self.visible = true
	timer.start()
#	colorRect.visible = true
#	label.visible = true


func _on_Timer_timeout():
	get_tree().change_scene("res://MainMenu.tscn")
