extends RigidBody2D

const SPEED = 1000
const DISC_SIZE = 0.3

var velocity


func _ready():
	get_node("CollisionShape2D").scale = Vector2(DISC_SIZE, DISC_SIZE)
	get_node("Area2D").scale = Vector2(DISC_SIZE, DISC_SIZE)
	get_node("DiscSprite").scale = Vector2(DISC_SIZE, DISC_SIZE)
	var randRotation = randi_range(0, 360)
	velocity = Vector2(cos(randRotation), sin(randRotation)) * SPEED
	
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		

func _on_timer_timeout():
	queue_free()


func _on_area_2d_body_entered(body):
	body.death()
