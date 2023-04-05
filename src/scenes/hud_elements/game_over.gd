extends CanvasLayer

func _on_TouchScreenButton_pressed():
	Global.can_control = true
	Global.number_of_lifes = 5
	var scene = "res://scenes/levels/level_" + str(Global.level) + ".tscn"
	get_tree().change_scene(scene)
