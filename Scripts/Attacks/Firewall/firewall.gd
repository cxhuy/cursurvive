extends RigidBody2D

const friction = 0.97
const wallCount = 60

var wall = preload("res://Scenes/Attacks/wall.tscn")
var wallInstance
var velocity
var wallSpawned = 0


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	velocity *= friction
	
	if wallSpawned < wallCount:
		wallInstance = wall.instantiate()
		wallInstance.global_position = self.global_position
		get_node("../..").add_child(wallInstance)
		wallSpawned += 1
	else:
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(0, 0), 0.1)
		await get_tree().create_timer(0.1).timeout
		self.queue_free()
