extends Node2D


func _on_StartBtn_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()
