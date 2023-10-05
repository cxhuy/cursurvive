extends CharacterBody2D

var Player
var offset = 65

# Called when the node enters the scene tree for the first time.
func _ready():
	Player = get_node("../Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	var mousePos = get_global_mouse_position()
	var selfPos = self.global_position
	if (abs(mousePos.x - selfPos.x) > 0.01):
		self.global_position = Player.global_position
		self.rotation = Player.get_node("Marker2D").rotation
		self.rotation_degrees -= 25
		self.global_position.x += cos(deg_to_rad(self.rotation_degrees - 90)) * offset
		self.global_position.y += sin(deg_to_rad(self.rotation_degrees - 90)) * offset
		
		
func _on_area_2d_body_entered(body):
	body.queue_free()
