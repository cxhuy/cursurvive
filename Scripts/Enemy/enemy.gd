extends CharacterBody2D

var Player

# Called when the node enters the scene tree for the first time.
func _ready():
	Player = get_node("../Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	if Player != null:
		look_at(Player.global_position)
	

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		Player.death()
