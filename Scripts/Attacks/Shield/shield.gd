extends Node2D

var shieldNames = ["red", "green", "blue", "yellow"]
var shieldId


func _ready():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.2, 1.2), 0.2)
	
	get_node("ShieldSprite").texture = \
	load("res://Sprites/Attacks/Shield/shield_" + shieldNames[shieldId] + ".png")


func _physics_process(delta):
	self.rotation_degrees -= 2.5


func _on_attack_range_body_entered(body):
	body.death()
	

func _on_duration_timeout():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0, 0), 0.1)
	await get_tree().create_timer(0.1).timeout
