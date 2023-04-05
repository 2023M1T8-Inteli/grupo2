extends Area2D


func _ready():
	$elevator/animation.play("closing")
	
func _on_Area2D_body_entered(body):
	#Ao entrar na área do elevador, a animação dele se abrindo é executada.
	$elevator/animation.play("opening")

func _on_Area2D_body_exited(body):
	#Ao sair  na área do elevador, a animação dele se fechando é executada.
	$elevator/animation.play("closing")
