extends Node2D

func _process(delta):
	#Mostra a caixa de diálogo caso ela esteja ativa
	if Global.is_dialog_active:
		$dialog_box.show()
	else:
		$dialog_box.hide()
