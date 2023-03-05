extends Node2D


func _process(delta):
	get_node("QTDMoedas").text = str(Global.moedas)
	
	if Global.status == 0:
		$Gameover.show() #Aparece tela gameover
		
	
		if Input.is_action_pressed("ui_accept"): #Input para quando pressionar enter, reiniciar
			$Gameover.hide()
			Global.status = 1
			get_tree().reload_current_scene()
			
		if Input.is_action_pressed("ui_cancel"): #Input para quando pressionar ESC, voltar a selecao de personagem(TEMPORARIO)
			get_tree().reload_current_scene()
			get_tree().change_scene_to(load("res://Cenas/SelecaoDePersonagem/SelecaoDePersonagem.tscn"))

func _ready():
	if Global.jogador_escolhido == 1:
		 $personagem/texture.texture = load("res://FramesBoneco/Tecnico/BonecoParadoTecnico/parado1.png")
	if Global.jogador_escolhido == 2:
		$personagem/texture.texture = load("res://FramesBoneco/Adm/BonecoAdmParado/parado1.png")
	if Global.jogador_escolhido == 3:
		$personagem/texture.texture = load("res://FramesBoneco/Exec/Sandra.png")
	$Gameover.hide()
	





