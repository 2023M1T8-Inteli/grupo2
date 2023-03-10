extends Area2D

func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("opening")


func _on_Area2D_body_exited(body):
	$AnimationPlayer.play("closing")
