extends Area2D


func _ready():
	$elevator/animation.play("closing")
	
func _on_Area2D_body_entered(body):
	$elevator/animation.play("opening")

func _on_Area2D_body_exited(body):
	$elevator/animation.play("closing")
