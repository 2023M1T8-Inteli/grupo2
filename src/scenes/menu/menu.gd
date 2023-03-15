extends Control

func _ready():
	SfxEffects.play_music()

func _on_Button_pressed():
	pass
#	get_tree().change_scene_to(load("res://scenes/levels/level1.tscn"))

func _on_Button2_pressed():
	get_tree().change_scene_to(load("res://scenes/options/options.tscn"))
