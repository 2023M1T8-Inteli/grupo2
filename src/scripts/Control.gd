extends Control


func _process(delta):
	$TextureProgress.value = Global.number_of_lifes * 20
