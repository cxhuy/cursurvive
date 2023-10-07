extends RigidBody2D

const SPEED = 1000

var velocity
var discSize = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("CollisionShape2D").scale = Vector2(discSize, discSize)
	get_node("Area2D").scale = Vector2(discSize, discSize)
	get_node("Dvd-r").scale = Vector2(discSize, discSize)
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
