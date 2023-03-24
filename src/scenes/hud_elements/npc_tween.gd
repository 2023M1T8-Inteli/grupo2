extends Tween

func _ready():
	#Animação dos textos dos diálogo
	var tween = create_tween()
	tween.tween_property(self, "visible_ratio", 1, 5.0)
	tween.set_trans(Tween.TRANS_CUBIC)
