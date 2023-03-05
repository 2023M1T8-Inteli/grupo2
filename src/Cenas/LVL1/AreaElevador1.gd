extends Area2D





func _on_AreaElevador1_body_entered(body):
	$Elevador/AnimationPlayer.play("ElevadorAbrindo")




func _on_AreaElevador1_body_exited(body):
	$Elevador/AnimationPlayer.play("ElevadorFechando")
