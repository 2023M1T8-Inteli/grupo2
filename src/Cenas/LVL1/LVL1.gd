extends Node2D



#Funcao para saber qual skin de personagem usar
func _ready():
	if Global.jogador_escolhido == 1:
		 $Personagem/Skin.texture = load("res://FramesBoneco/Tecnico/BonecoParadoTecnico/parado1.png")
	if Global.jogador_escolhido == 2:
			$Personagem/Skin.texture = load("res://FramesBoneco/Adm/BonecoAdmParado/parado1.png")
	$Gameover.hide() #Esconde tela gameover
	
#Funcao para quando o jogador morrer, parar o jogo 
func _process(delta):
	if Global.status == 0:
		$Gameover.show() #Aparece tela gameover
		
	
		if Input.is_action_pressed("ui_accept"): #Input para quando pressionar enter, reiniciar
			$Gameover.hide()
			Global.status = 1
			get_tree().reload_current_scene()
			
		if Input.is_action_pressed("ui_cancel"): #Input para quando pressionar ESC, voltar a selecao de personagem(TEMPORARIO)
			get_tree().reload_current_scene()
			get_tree().change_scene_to(load("res://Cenas/SelecaoDePersonagem/SelecaoDePersonagem.tscn"))
			
			
