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
	

func _on_wall_spawn_timeout():
	if wallSpawned < wallCount:
		wallInstance = wall.instantiate()
		wallInstance.global_position = self.global_position
		get_node("../..").add_child(wallInstance)
		wallSpawned += 1
