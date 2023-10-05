extends CharacterBody2D

const SPEED = 10000

var Player

# Called when the node enters the scene tree for the first time.
func _ready():
	Player = get_node("../../Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	look_at(Player.global_position)
	velocity = Vector2(cos(rotation), sin(rotation)) * SPEED * delta
	move_and_slide()
	

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		Player.death()
