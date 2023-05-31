extends Node2D


export var max_health: float = 100.0
var current_health: float


func _ready():
	EventBus.connect("player_take_damage", self, "_on_player_take_damage")
	EventBus.connect("player_receive_health", self, "_on_player_receive_health")
	self.current_health = self.max_health

func _on_player_take_damage(damage: int):
	self.current_health = max(self.current_health - damage, 0)
	$HealthBar.value = self.get_health_percentage()
	if self.current_health <= 0:
		player_die()

func _on_player_receive_health(health: int):
	self.current_health = min(self.current_health + health, self.max_health)
	$HealthBar.value = self.get_health_percentage()

	
func get_health_percentage():
	return (self.current_health / self.max_health) * 100
	
func player_die():
	EventBus.emit_signal("player_die")
		
