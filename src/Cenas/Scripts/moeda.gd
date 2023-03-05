extends Area2D



#Funcão de Add moedas a contagem e, der play na animacao da moeda ao escontar nela
func _on_moeda_body_entered(body):
	$AnimationPlayer.play("Moeda")
	body.adicionar_moeda()

#Quando finalizar animação, sumir moeda
func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	
func _ready():
	$CoinGold.position.x = 272
	$CoinGold.position.y = 287
