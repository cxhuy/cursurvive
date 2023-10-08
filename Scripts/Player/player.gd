extends CharacterBody2D

const SPEED = 400

var mousePos


func _physics_process(delta):
	self.velocity = (get_global_mouse_position() - self.global_position) * SPEED * delta	
	move_and_slide()
	
	
func death():
	get_tree().paused = true
#	self.queue_free()
