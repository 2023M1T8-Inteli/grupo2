extends Label

func _ready():
	#Animação do texto dos diálogos
	$npc_tween.interpolate_property(
		self, "percent_visible", 0.0, 1.0, 3.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
