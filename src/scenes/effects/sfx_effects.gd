extends Node2D

func _ready():
	#Seta os volumes específicos de cada música
	$death.volume_db = -80
	$main_song.volume_db = -28
	$jump.volume_db = -80
	
func _process(delta):
	#Altera os volumes de cada música de acordo com o volume que o usuário selecionou na tela de configurações. O som de death é maior para se destacar na música de fundo.
	$death.volume_db = Global.volume + 10
	$main_song.volume_db = Global.volume - 10
	$jump.volume_db = Global.volume

#Funções da música do jogo
func play_music():
	$main_song.play()

func _death():
	$death.play()

func _jump():
	$jump.play()
