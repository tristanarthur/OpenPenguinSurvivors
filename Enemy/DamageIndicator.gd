extends Label





func _ready():
	# Start fade animation
	$Tween.interpolate_property(
		self, 
		"modulate:a", 
		1, 
		0, 
		1, 
		Tween.TRANS_LINEAR, 
		Tween.EASE_IN_OUT
	)
	$Tween.start()
	self.set_position(Vector2(500,0), true)



func _on_tween_all_completed():
	queue_free()
