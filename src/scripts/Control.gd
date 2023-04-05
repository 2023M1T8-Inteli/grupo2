extends CanvasLayer

func _process(delta):
	#A barra de progresso varia de 0 a 100, como são 5 vidas, a gente multiplica o número de vidas por 20, já que cada coração ficará preenchido com um múltiplo de 20.
	$TextureProgress.value = Global.number_of_lifes * 20
