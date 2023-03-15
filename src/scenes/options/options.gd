extends Node2D


func _on_HSlider_value_changed(value):
	Global.volume = -80 + (value * 10.4)
	print(Global.volume)


func _on_back_button_pressed():
	get_tree().change_scene_to(load("res://scenes/menu/menu.tscn"))
