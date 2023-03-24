extends Area2D

func _ready():
	#Animações d elevador
	$elevator/animation.play("closing")
	$up_arrow.hide()
	
func _process(delta):
	#Verifica se o jogador pode utilizar o elevador para ir ao próximo level
	if Global.can_go_to_next_level:
		$up_arrow.show()

func _on_Area2D_body_entered(body):
	if Global.can_go_to_next_level:
		$elevator/animation.play("opening")

func _on_Area2D_body_exited(body):
	if Global.can_go_to_next_level:
		$elevator/animation.play("closing")

func _on_next_level_button_pressed():
	#Redireciona para o próximo level, caso o jogador possa fazer isso
	if Global.can_go_to_next_level:
		get_tree().change_scene("res://scenes/levels/level_2.tscn")
