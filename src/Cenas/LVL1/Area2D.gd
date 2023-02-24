extends Area2D



#Funcao a fim de quando colision do personagem entrar em contato com a moeda, a moeda sumir e mudar status = 0
func _on_moeda_body_entered(body):
	#Sumir com moeda
	queue_free()
	Global.status = 0
	
	

