extends KinematicBody2D

export var speed: int = 100
export var health: int = 100


func _ready():
	pass 
	
	
func _physics_process(_delta: float):
	var direction_to_target = (Player.position - self.position).normalized()
	move_and_slide(direction_to_target * speed)
	
func take_damage(damage: int):
	self.health -= damage
	if self.health <= 0:
		queue_free()
