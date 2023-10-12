extends Node2D

var shield = preload("res://Scenes/Attacks/shield.tscn")

@onready var Player = get_node("../Player")


func _ready():
	var shieldInstance = shield.instantiate()
	add_child(shieldInstance)
	shieldInstance.global_position = self.global_position	
	

func _process(delta):
	self.global_position = Player.global_position
