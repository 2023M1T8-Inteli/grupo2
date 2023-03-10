extends CanvasLayer

func _on_TouchScreenButton_pressed():
	Global.jump = true


func _on_TouchScreenButton_released():
	Global.jump = false


func _on_TouchScreenButton2_pressed():
	Global.left = true


func _on_TouchScreenButton2_released():
	Global.left = false


func _on_TouchScreenButton3_pressed():
	Global.right = true


func _on_TouchScreenButton3_released():
	Global.right = false
