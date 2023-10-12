extends RigidBody2D

const friction = 0.97

var velocity

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	velocity *= friction
	
