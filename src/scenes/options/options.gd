extends Node2D


func _on_HSlider_value_changed(value):
	#Seta um valor para o volume com base na escala do godot (-80 a 24) e com base nas nossas divisões (em 10 partes)
	Global.volume = -80 + (value * 10.4)
	print(Global.volume)

func _on_back_button_pressed():
	get_tree().change_scene_to(load("res://scenes/menu/menu.tscn"))
