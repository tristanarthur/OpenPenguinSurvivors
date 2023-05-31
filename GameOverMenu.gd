extends PopupPanel


func _ready():
	EventBus.connect("player_die", self, "show_gameover_popup")
	
func show_gameover_popup():
	get_tree().paused = true
	self.show()

func _on_quit_button_pressed():
	get_tree().quit()


func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
	self.hide()
