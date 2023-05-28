extends KinematicBody2D


export var speed: int = 300
var velocity: Vector2 = Vector2()
var commit_gems: int = 0


func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide(velocity)

func _on_attract_area_entered(area: Area2D):
	pass
	
func _on_pickup_area_entered(area: Area2D):
	if area.is_in_group("commit_gem_area"):
		# This is a hack and should be replaced
		area.get_parent().queue_free()
		commit_gems += 1
