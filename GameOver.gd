extends Node2D


onready var timer = $Timer



func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://MainMenu.tscn")
	print(timer.time_left)


func _on_Timer_timeout():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_PlayAgainBtn_button_down():
	get_tree().change_scene("res://Game.tscn")


func _on_Credits_button_down():
	get_tree().change_scene("res://Credits.tscn")
