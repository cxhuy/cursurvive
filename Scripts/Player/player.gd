extends CharacterBody2D

const SPEED = 400

var mousePos
var selfPos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Game.player_dead:
		death()
	

func _physics_process(delta):
	mousePos = get_global_mouse_position()
	selfPos = self.global_position
	self.velocity = (mousePos - selfPos) * SPEED * delta	
	move_and_slide()
	
	
func death():
	self.queue_free()
