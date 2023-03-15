extends Area2D

func _on_StaticBody2D_body_entered(body):
	Global.is_near_NPC = true

func _on_StaticBody2D_body_exited(body):
	Global.is_near_NPC = false
	Global.dia = false

func _on_Area2D3_body_entered(body):
	Global.number_of_lifes -= 1
	if Global.number_of_lifes != 0:
		get_tree().reload_current_scene()
