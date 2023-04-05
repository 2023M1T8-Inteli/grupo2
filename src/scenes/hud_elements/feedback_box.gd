extends Sprite

#Fechar a caixa de feedback da pergunta
func _on_TouchScreenButton_pressed():
	Global.can_control = true
	Global.is_dialog_active = false
	Global.is_feedback_box_active = false
