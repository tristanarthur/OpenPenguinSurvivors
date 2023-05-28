extends KinematicBody2D


var followee: Area2D
export var FOLLOW_SPEED: int = 450;


func _ready():
	pass
	
func _physics_process(_delta):
	if self.followee != null:
		var followee_position = self.followee.get_global_transform().get_origin()
		var direction_to_target = (followee_position - self.position).normalized()
		move_and_slide(direction_to_target * FOLLOW_SPEED)


func _on_area_entered(area: Area2D):
	if area.is_in_group("attract_area"):
		self.followee = area
		
