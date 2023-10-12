extends Node2D

const RADIUS = 80

var shield = preload("res://Scenes/Attacks/shield.tscn")

@onready var Player = get_node("../Player")


func _ready():
	var shieldInstance = shield.instantiate()
	shieldInstance.shieldId = 0
	add_child(shieldInstance)
	shieldInstance.global_position = self.global_position + Vector2(0, -RADIUS)
	
	shieldInstance = shield.instantiate()
	shieldInstance.shieldId = 1
	add_child(shieldInstance)
	shieldInstance.global_position = self.global_position + Vector2(RADIUS, 0)
	
	shieldInstance = shield.instantiate()
	shieldInstance.shieldId = 2
	add_child(shieldInstance)
	shieldInstance.global_position = self.global_position + Vector2(0, RADIUS)
	
	shieldInstance = shield.instantiate()
	shieldInstance.shieldId = 3
	add_child(shieldInstance)
	shieldInstance.global_position = self.global_position + Vector2(-RADIUS, 0)
	

func _physics_process(delta):
	self.global_position = Player.global_position
	self.rotation_degrees += 2.5
