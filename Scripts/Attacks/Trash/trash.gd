extends Node2D

const power = 175

var enemies_in_range


func _ready():
	pass


func _process(delta):
	enemies_in_range = get_node("GravityRange").get_overlapping_areas()
	for enemy in enemies_in_range:	
		enemy = enemy.get_node("../")
		enemy.global_position -= \
		(enemy.global_position - self.global_position).normalized() * delta * power
