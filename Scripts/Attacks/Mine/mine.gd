extends Node2D

const EXPLOSION_DURATION = 2

var canExplode = false
var exploding = false


func _ready():
	var tween = create_tween().set_trans(Tween.TRANS_EXPO)
	var mineSpawnPos_x = randi_range(0 + 50, get_viewport_rect().size.x - 50)
	var mineSpawnPos_y = randi_range(0 + 50, get_viewport_rect().size.y - 50)
	tween.tween_property(self, "global_position", Vector2(mineSpawnPos_x, mineSpawnPos_y), 0.5)
	tween = create_tween().set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2)	
	await get_tree().create_timer(0.5).timeout
	canExplode = true


func _on_area_2d_body_entered(body):
	if canExplode:
		exploding = true
		get_node("AttackRange").queue_free()
		get_node("MineSprite").queue_free()
		
		var tween = create_tween()
		tween.tween_property(get_node("AttackBody/CollisionShape2D"), "scale", Vector2(1, 1), 0.2)
		await get_tree().create_timer(EXPLOSION_DURATION).timeout
		var tween2 = get_tree().create_tween()
		tween2.tween_property(get_node("AttackBody/CollisionShape2D"), "scale", Vector2(0, 0), 0.2)
		await get_tree().create_timer(0.2).timeout		
		self.queue_free()	
		
		
func _on_attack_body_body_entered(body):
	body.queue_free()


func _on_duration_timeout():
	if !exploding:	
		self.queue_free()
