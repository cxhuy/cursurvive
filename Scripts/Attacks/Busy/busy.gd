extends CharacterBody2D

const SPEED = 400

var enemy_to_chase
var chase = false
var enemyPos
var selfPos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var enemies_in_range = get_node("AttackRange").get_overlapping_areas()
	
	if chase and enemy_to_chase != null:
		pass
	else:
		if enemies_in_range.size() != 0:
			enemy_to_chase = enemies_in_range[randi_range(0, enemies_in_range.size() - 1)]
			chase = true
			get_node("AttackRange/CollisionShape2D").shape.radius = 0.01
			
		else:
			get_node("AttackRange/CollisionShape2D").shape.radius += 20		
		
			
func _physics_process(delta):
	if chase and enemy_to_chase != null:
		enemyPos = enemy_to_chase.global_position
		selfPos = self.global_position
		self.velocity = (enemyPos - selfPos) * SPEED * delta	
		move_and_slide()
		
		
func _on_attack_body_body_entered(body):
	body.queue_free()
