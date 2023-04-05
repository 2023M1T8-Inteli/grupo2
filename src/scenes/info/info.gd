extends Node2D

func _on_back_button_pressed():
	#Volta para a tela inicial do jogo ao pressionar o botão voltar
	get_tree().change_scene_to(load("res://scenes/menu/menu.tscn"))
