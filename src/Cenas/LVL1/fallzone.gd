extends Area2D


#Funcao para quando boneco cair do mapa, mudar status = 0
func _on_fallzone_body_entered(body: Node) -> void:
	Global.status = 0
	
