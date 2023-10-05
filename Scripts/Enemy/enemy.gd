extends CharacterBody2D

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	look_at(player.global_position)
	

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		Game.player_dead = true
