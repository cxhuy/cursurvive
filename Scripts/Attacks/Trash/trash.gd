extends Node2D

const power = 175

var canAttack = false
var enemies_in_range


func _ready():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2)
	await get_tree().create_timer(1).timeout
	canAttack = true
	tween = create_tween()
	tween.tween_property(get_node("GravityRange/CollisionShape2D"), "scale", Vector2(1, 1), 0.2)
	await get_tree().create_timer(4).timeout
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0, 0), 0.1)
	await get_tree().create_timer(0.1).timeout
	self.queue_free()
	

func _process(delta):
	if canAttack:
		enemies_in_range = get_node("GravityRange").get_overlapping_areas()
		for enemy in enemies_in_range:	
			enemy = enemy.get_node("../")
			enemy.global_position -= \
			(enemy.global_position - self.global_position).normalized() * delta * power


func _on_attack_range_body_entered(body):
	body.queue_free()
