extends Node
@onready var bg_music: AudioStreamPlayer = $bg_music
@onready var bg_2_music: AudioStreamPlayer = $bg2_music
@onready var footsteps: AudioStreamPlayer = $footsteps
@onready var win: AudioStreamPlayer = $win
@onready var die: AudioStreamPlayer = $die


func play_music():
	bg_2_music.stop()
	bg_music.play()
	await get_tree().create_timer(19).timeout
	bg_2_music.play()
	
func walksound():
	footsteps.volume_db=-200
	footsteps.play()
	
	
func walking():
	footsteps.volume_db=-20
	
func walkstop():
	footsteps.volume_db=-200

func winlevel():
	win.play()
	

func killed():
	die.play()
