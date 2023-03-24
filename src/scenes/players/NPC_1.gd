extends Area2D

func _ready():
	#Esconde os botões e cards de interação
	$interage_button.hide()
	$card.hide()

#Exibe e esconde o botão e card de interação ao entrar e sair de perto do NPC
func _on_npc_body_entered(body):
	$interage_button.show()
	$card.show()

func _on_npc_body_exited(body):
	$interage_button.hide()
	$card.hide()

func _on_interage_button_pressed():
	#Abre a caixa de diálogo
	Global.is_dialog_active = true
