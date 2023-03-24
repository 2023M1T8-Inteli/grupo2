extends Control

func _ready():
	#Reproduz a música do jogo
	SfxEffects.play_music()

func _on_Button_pressed():
	#Redireciona para o jogo
	get_tree().change_scene_to(load("res://scenes/levels/level_1.tscn"))

func _on_Button2_pressed():
	#Redireciona para as configurações
	get_tree().change_scene_to(load("res://scenes/options/options.tscn"))
