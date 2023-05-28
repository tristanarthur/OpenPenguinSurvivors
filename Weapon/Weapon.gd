extends Node2D


var direction: Vector2
export var Projectile: PackedScene = preload("res://Weapon/Bullet.tscn")

func _ready():
	pass 


func set_direction():
	var new_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if new_direction != Vector2(0, 0):
		direction = new_direction
	
func _process(_delta: float):
	set_direction()

func _on_attack_timer_timeout():
	var projectile = Projectile.instance()
	projectile.direction = self.direction
	add_child(projectile)
