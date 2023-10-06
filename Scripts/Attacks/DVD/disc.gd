extends RigidBody2D

const SPEED = 800

var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	var randRotation = randi_range(0, 360)
	velocity = Vector2(cos(randRotation), sin(randRotation)) * SPEED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		

func _on_timer_timeout():
	queue_free()


func _on_area_2d_body_entered(body):
	body.queue_free()
