extends KinematicBody2D

export var speed: int = 100
export var health: int = 100
export var damage: int = 20
export var DamageIndicator: PackedScene = preload("res://Enemy/DamageIndicator.tscn")
export var LootDrop: PackedScene = preload("res://Pickup/Pickup.tscn")
var touching_player = false



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


func _on_hitbox_area_entered(area):
	$DamageGrace.start()
	if area.is_in_group("player_hitbox"):
		self.touching_player = true

func try_do_damage():
	if $DamageGrace.is_stopped():
		EventBus.emit_signal("player_take_damage", self.damage)
		$DamageGrace.start()

func _on_hitbox_area_exited(area):
	if area.is_in_group("player_hitbox"):
		self.touching_player = false

func _on_damage_grace_timeout():
	if self.touching_player:
		try_do_damage()
