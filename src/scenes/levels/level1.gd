extends Node2D

func _ready():
	$dialogue_box.hide()
	$Control.hide()
	
func _process(delta):
#	if 
	
	if Global.dia:
		$dialogue_box.show()
	else:
		$dialogue_box.hide()
