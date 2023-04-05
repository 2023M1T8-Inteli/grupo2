extends Area2D

func _ready():
	#Esconde os botões e cards de interação
	$interage_button.hide()
	$card.hide()
	
func _process(delta):
	if Global.level == 1 or Global.level == 0:
		$Sprite/AnimationPlayer.play("idle_diana")
	elif Global.level == 2:
		$Sprite/AnimationPlayer.play("idle_otavio")
	elif Global.level == 3:
		$Sprite/AnimationPlayer.play("idle_morilo")
	elif Global.level == 4:
		$Sprite/AnimationPlayer.play("idle_nauru")
	elif Global.level == 5:
		$Sprite/AnimationPlayer.play("idle_cinderelo")
	elif Global.level == 6:
		$Sprite/AnimationPlayer.play("idle_pedro")

#Exibe e esconde o botão e card de interação ao entrar e sair de perto do NPC
func _on_npc_body_entered(body):
	if !Global.has_dialog_finished:
		$interage_button.show()
		$card.show()

func _on_npc_body_exited(body):
	$interage_button.hide()
	$card.hide()

func _on_interage_button_pressed():
	#Abre a caixa de diálogo e remove movimento do personagem
	if !Global.has_dialog_finished:
		Global.can_control = false
		Global.is_dialog_active = true
