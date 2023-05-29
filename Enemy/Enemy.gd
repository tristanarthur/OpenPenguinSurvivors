extends KinematicBody2D

export var speed: int = 100
export var health: int = 100
export var DamageIndicator: PackedScene = preload("res://Enemy/DamageIndicator.tscn")
export var LootDrop: PackedScene = preload("res://Pickup/Pickup.tscn")


func _ready():
	pass 
	
	
func _physics_process(_delta: float):
	var direction_to_target = (Player.position - self.position).normalized()
	move_and_slide(direction_to_target * speed)
	
func take_damage(damage: int):
	self.health -= damage
	var damage_indicator: Label = DamageIndicator.instance()
	damage_indicator.text = str(damage)
	add_child(damage_indicator)
	
	if self.health <= 0:
		die()

func die():
	var loot_drop = LootDrop.instance()
	loot_drop.position = self.position
	self.get_parent().add_child(loot_drop)
	queue_free()
