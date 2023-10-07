extends Node2D

var canExplode = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2)	
	await get_tree().create_timer(0.5).timeout
	canExplode = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_area_2d_body_entered(body):
	if canExplode:
		get_node("AttackRange").queue_free()
		get_node("MineSprite").queue_free()
		var tween = get_tree().create_tween()
		tween.tween_property(get_node("AttackBody/CollisionShape2D"), "scale", Vector2(1, 1), 0.2)
		await get_tree().create_timer(2).timeout
		var tween2 = get_tree().create_tween()
		tween2.tween_property(get_node("AttackBody/CollisionShape2D"), "scale", Vector2(0, 0), 0.2)
		await get_tree().create_timer(0.2).timeout		
		self.queue_free()	
		
		
func _on_attack_body_body_entered(body):
	body.queue_free()
