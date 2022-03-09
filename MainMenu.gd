extends Node2D

onready var loopTimer = get_node("loopTimer")
onready var CameraNode2D = $ColorRect/Camera2D
onready var crawl = $crawl
onready var orb = $crawl/AnimatedSprite
onready var StartScreen = get_node("ColorRect/StartScreen")


func _process(_delta):
	
	var orbPosition = orb.get_global_position()
	
	if orbPosition.y < CameraNode2D.get_global_position().y or Input.is_action_just_pressed("ui_accept"):
		StartScreen.visible = true;
		crawl.visible = false
		orb.visible = false
		loopTimer.start()



func _on_StartBtn_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()


func _on_loopTimer_timeout():
	print("loop timeout")
	get_tree().reload_current_scene()
