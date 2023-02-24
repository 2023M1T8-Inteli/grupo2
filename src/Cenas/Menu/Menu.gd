extends Control



#Botão para iniciar o jogo
func _on_BotaoJogar_button_up():
	get_tree().change_scene_to(load("res://Cenas/SelecaoDePersonagem/SelecaoDePersonagem.tscn"))




