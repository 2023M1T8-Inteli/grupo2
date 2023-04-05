extends Node2D

func _ready():
	#Seta a possibilidade do personagem se movimentar
	Global.can_control = true
	#Seta o level atual
	Global.level = 3
	#Seta o estado do personagem (vivo)
	Global.is_dead = false
	#Seta que o item colecionável da fase não foi capturado
	Global.was_item_caught = false
	#Seta o diálogo não finalizado
	Global.has_dialog_finished = false
	#Esconde o game over
	$Control.hide()

func _process(delta):
	#Mostra o game over
	if Global.number_of_lifes == 0:
		Global.can_control = false
		$Control.show()

#Função para caso o jogador entre em uma área que perde vida
func _on_deathzone_body_entered(body):
	Global.number_of_lifes -= 1
	Global.is_dead = true
	$deathzone/Timer.start()
	SfxEffects._death()

#Timer acionado somente quando o jogador morre. Quando ele termina, a cena (level) é reiniciado
func _on_Timer_timeout():
	get_tree().reload_current_scene()
