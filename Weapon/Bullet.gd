extends KinematicBody2D

export var SPEED: int = 400
var direction: Vector2
const DEFAULT_DIRECTION = Vector2(1, 0)
export var minimum_damage = 50
export var maximum_damage = 80


func _ready():
	pass


func _physics_process(delta: float):
	if self.direction == null or self.direction == Vector2(0, 0):
		self.direction = DEFAULT_DIRECTION

	move_and_slide(direction * SPEED)


func _on_timeout():
	queue_free()


func _on_damage_area_entered(area: Area2D):
	if area.is_in_group("enemy_hitbox") and area.has_method("take_damage"):
		area.take_damage(
			randi() % (self.maximum_damage - self.minimum_damage) + self.minimum_damage
		)
		queue_free()
