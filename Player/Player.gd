extends KinematicBody2D

export var speed: int = 300
var velocity: Vector2 = Vector2()
var current_level: int
var current_xp: float


signal player_xp_update(xp_percent)
signal player_level_up(level)

func _ready():
	self.current_level = 1
	self.current_xp = 0.0


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
		self.get_xp(1)


func get_xp_to_next_level():
	return pow(current_level + 1, 2)

func get_xp(xp: int):
	self.current_xp += xp
	var level_percent = (self.current_xp / self.get_xp_to_next_level()) * 100
	emit_signal("player_xp_update", level_percent)
	if level_percent >= 100:
		self.level_up(get_xp_to_next_level())

func level_up(xp_cost: int):
	self.current_xp -= xp_cost
	self.current_level += 1
	emit_signal("player_level_up", self.current_level)
	emit_signal("player_xp_update", self.current_xp)

