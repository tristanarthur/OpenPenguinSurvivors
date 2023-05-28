extends KinematicBody2D

export var speed: int = 100
export var health: int = 100




func _ready():
	pass 
	
	
func _physics_process(_delta):
	var direction_to_target = (Player.position - self.position).normalized()
	move_and_slide(direction_to_target * speed)

