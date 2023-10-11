extends Node2D

const power = 175

var canAttack = false
var enemies_in_range


func _ready():
	await get_tree().create_timer(1).timeout
	canAttack = true

func _process(delta):
	if canAttack:
		enemies_in_range = get_node("GravityRange").get_overlapping_areas()
		for enemy in enemies_in_range:	
			enemy = enemy.get_node("../")
			enemy.global_position -= \
			(enemy.global_position - self.global_position).normalized() * delta * power


func _on_attack_range_body_entered(body):
	body.queue_free()
