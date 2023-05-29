extends Node2D

export var Enemy: PackedScene = preload("res://Enemy/Enemy.tscn")

func _ready():
	pass


func _on_spawn_timer_timeout():
	var enemy = Enemy.instance()
	enemy.position = get_random_point_on_edge_of_spawn_zone()
	get_node("/root").add_child(enemy)

func get_random_point_on_edge_of_spawn_zone() -> Vector2:
	var spawn_shape: CircleShape2D = $NoSpawnArea/SpawnShape.shape
	var spawn_radius = spawn_shape.radius
	var random_angle_radian = (randi() % 361) * PI / 180
	var x = self.global_position.x + (spawn_radius * cos(random_angle_radian))
	var y = self.global_position.y + (spawn_radius * sin(random_angle_radian))
	
	return Vector2(x, y)
