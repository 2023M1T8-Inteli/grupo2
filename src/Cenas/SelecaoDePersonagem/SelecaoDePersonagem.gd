extends Control





#Se escolher tecnico
func _on_BotaoIrTec_pressed():
	Global.jogador_escolhido = 1
	get_tree().change_scene_to(load("res://Cenas/Tutorial/Tutorial.tscn"))

#Se escolher ADM
func _on_BotaoIrAdm_pressed():
	Global.jogador_escolhido = 2
	get_tree().change_scene_to(load("res://Cenas/Tutorial/Tutorial.tscn"))
