extends Node2D

func _ready():
	#Animação do item colecionável
	$AnimationPlayer.play("cash_play")

func _on_areacolectable_body_entered(body):
	#Coleta o item e remove-o da tela
	$Timer.start()
	$AnimationPlayer.play("cash_picked")
	Global.was_item_caught = true

func _on_Timer_timeout():
	queue_free()
