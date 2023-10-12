extends Node2D

var shieldNames = ["red", "green", "blue", "yellow"]
var shieldId


func _ready():
	get_node("ShieldSprite").texture = \
	load("res://Sprites/Attacks/Shield/shield_" + shieldNames[shieldId] + ".png")


func _on_attack_range_body_entered(body):
	body.queue_free()
