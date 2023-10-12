extends Node2D

var shieldNames = ["red", "green", "blue", "yellow"]
var shieldId


func _ready():
	get_node("ShieldSprite").texture = \
	load("res://Sprites/Attacks/Shield/shield_" + shieldNames[shieldId] + ".png")


func _physics_process(delta):
	self.rotation_degrees -= 2.5


func _on_attack_range_body_entered(body):
	body.queue_free()
