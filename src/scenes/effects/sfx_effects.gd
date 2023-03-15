extends Node2D

func _ready():
	$death.volume_db = -80
	$main_song.volume_db = -28
	$jump.volume_db = -80
	
func _process(delta):
	$death.volume_db = -80
	$main_song.volume_db = Global.volume
	$jump.volume_db = -80
	
func play_music():
	$main_song.play()
