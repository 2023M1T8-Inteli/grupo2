extends Control

func _on_Button_pressed():
	get_tree().change_scene_to(load("res://scenes/levels/level1.tscn"))
