extends CharacterBody2D

var SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _physics_process(delta):
	self.velocity = (get_global_mouse_position() - self.global_position) * SPEED * delta
	move_and_slide()