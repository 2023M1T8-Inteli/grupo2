extends Node2D


func _ready():
	$AnimationPlayer.play("fio_play")

func _on_areacolectable_body_entered(body):
	#Coleta o item e remove-o da tela
	$Timer.start()
	$AnimationPlayer.play("fio_picked")
	Global.was_item_caught = true

func _on_Timer_timeout():
	queue_free()
