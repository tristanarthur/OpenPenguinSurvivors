extends Area2D



func _ready():
	pass

func take_damage(damage: int):
	get_parent().take_damage(damage)
