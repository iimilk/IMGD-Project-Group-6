extends Node2D

func _ready() -> void:
	$title_intro.play()
	$musicSync.start()

var fadeOutTimer = 0
var splashOut = false

func _on_timer_timeout() -> void:
	splashOut = true

func _process(delta: float) -> void:
	
	if (splashOut == false) and (fadeOutTimer < 1):
		fadeOutTimer = fadeOutTimer + delta

		$"Background Gradient".modulate.a = 1
	if (splashOut == true) and (fadeOutTimer > 0):
		fadeOutTimer = fadeOutTimer - delta/4.5
	
		



	$"WPI Logo".modulate.a = fadeOutTimer
	if (splashOut == true):
		#$"Background Gradient".modulate.a = fadeOutTimer
		$"Background Gradient".modulate.v = fadeOutTimer
		#$"splash".modulate.a = 1-fadeOutTimer
	


func _on_title_intro_finished() -> void:
	$title_main.play()
	$splash.visible = false
	$"Background Gradient".visible = false
	sub_menu(false)

func _on_music_sync_timeout() -> void:
	$splash.visible = true

func sub_menu(enabled: bool) -> void:
	if(enabled):
		$"HBoxContainer/Start Game Button".visible = false
		$"HBoxContainer/Version Notes Button".visible = false
		$"HBoxContainer/Credits Button".visible = false
		$"Back Button".visible = true
		$darkenedSplash.modulate = Color(0.08,0.08,0.08)
		$logo.visible = false
	else:
		$"HBoxContainer/Start Game Button".visible = true
		$"HBoxContainer/Version Notes Button".visible = true
		$"HBoxContainer/Credits Button".visible = true
		$"Back Button".visible = false
		$"ScrollContainer Version".visible = false
		$"ScrollContainer Credits".visible = false
		$darkenedSplash.modulate = Color(0.2,0.2,0.2)
		$logo.visible = true
	


func _on_version_notes_button_pressed() -> void:
	sub_menu(true)
	$"ScrollContainer Version".visible = true


func _on_credits_button_pressed() -> void:
	sub_menu(true)
	$"ScrollContainer Credits".visible = true


func _on_back_button_pressed() -> void:
	sub_menu(false)


func _on_start_game_button_pressed() -> void:
	$title_main.stop()
	$title_outro.play()
	$darkenedSplash.visible = false
	$"HBoxContainer/Start Game Button".visible = false
	$"HBoxContainer/Version Notes Button".visible = false
	$"HBoxContainer/Credits Button".visible = false
	$"Back Button".visible = false
	$logo.visible = false
	$"Background Gradient".visible = true
	$"Background Gradient".modulate = Color(0,0,0)
	#<insert code to switch to game scene>
	
	
