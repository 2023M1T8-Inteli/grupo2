extends Node2D

func _ready():
	#Define valores da música para música de morte, pulo e fundo
	$death.volume_db = -80
	$main_song.volume_db = -28
	$jump.volume_db = -80
	
func _process(delta):
	$death.volume_db = -80
	#Defina o volume da música do jogo com base na escolha do jogador no menu options
	$main_song.volume_db = Global.volume
	$jump.volume_db = -80
	
func play_music():
	$main_song.play()
