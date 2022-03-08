extends Node2D

export var limit : float = -1000

onready var CameraNode2D = $ColorRect/Camera2D
onready var crawl = $crawl
onready var orb = $crawl/AnimatedSprite
onready var StartScreen = get_node("ColorRect/StartScreen")

func _process(_delta):
	var orbPosition = orb.get_global_position()
#	print(crawlPosition)
#	print(StartScreen.visible)
	if orbPosition.y < CameraNode2D.get_global_position().y :
		StartScreen.visible = true;
		crawl.visible = 0
		orb.visible = 0
		

func _on_StartBtn_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()
