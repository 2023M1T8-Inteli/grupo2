extends CanvasLayer

#Código para movimentação com as setas

func _on_jump_pressed():
	Global.jump = true

func _on_jump_released():
	Global.jump = false


func _on_right_arrow_pressed():
	Global.right = true


func _on_right_arrow_released():
	Global.right = false


func _on_left_arrow_pressed():
	Global.left = true

func _on_left_arrow_released():
	Global.left = false
