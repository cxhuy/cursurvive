extends CharacterBody2D

const SPEED = 400

var enemy_to_chase
var chase = false


func _process(delta):
	var enemies_in_range = get_node("AttackRange").get_overlapping_areas()

	if !chase or enemy_to_chase == null:
		if enemies_in_range.size() != 0:
			enemy_to_chase = find_closest_enemy(enemies_in_range)
			chase = true
			get_node("AttackRange/CollisionShape2D").shape.radius = 0.01
			
		else:
			get_node("AttackRange/CollisionShape2D").shape.radius += 20		
		
			
func _physics_process(delta):
	if chase and enemy_to_chase != null:
		self.velocity = (enemy_to_chase.global_position - self.global_position) * SPEED * delta
		move_and_slide()
		
func find_closest_enemy(enemies_in_range):
	var closest_enemy = enemies_in_range[0]
	var closest_dist = self.global_position.distance_squared_to(closest_enemy.global_position)
	
	for enemy in enemies_in_range:
		if self.global_position.distance_squared_to(enemy.global_position) < closest_dist:
			closest_enemy = enemy
			
	return closest_enemy
		
		
func _on_attack_body_body_entered(body):
	body.queue_free()
	

func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0, 0), 0.1)
	await get_tree().create_timer(0.1).timeout
	self.queue_free()
