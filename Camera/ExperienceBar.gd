extends ProgressBar


func _ready():
	Player.connect("player_xp_update", self, "_on_player_xp_update")
	Player.connect("player_level_up", self, "_on_player_level_up")


func _on_player_xp_update(xp_percent: int):
	self.value = xp_percent


func _on_player_level_up(level: int):
	$LevelLabel.text = str(level)
