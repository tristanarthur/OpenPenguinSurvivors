extends PopupPanel


func _ready():
	pass


func _input(event):
	if event.is_action_pressed("ui_cancel") and !get_tree().paused:
		self.pause()
	elif event.is_action_pressed("ui_cancel") and get_tree().paused:
		self.unpause()


func pause():
	get_tree().paused = true
	self.show()


func unpause():
	get_tree().paused = false
	self.hide()


func _on_unpause_button_pressed():
	self.unpause()


func _on_quit_button_pressed():
	get_tree().quit()
