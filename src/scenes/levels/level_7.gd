extends Node2D

func _ready():
	#Seta a possibilidade do personagem se movimentar
	Global.can_control = true
	#Seta o level atual
	Global.level = 7
	#Seta o estado do personagem (vivo)
	Global.is_dead = false
	$CanvasLayer.hide()

func _on_home_pressed():
	get_tree().change_scene_to(load("res://scenes/menu/menu.tscn"))

func _on_TouchScreenButton_pressed():
	$CanvasLayer.show()
