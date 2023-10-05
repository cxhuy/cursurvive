extends CharacterBody2D

const SPEED = 50000

var Player
var offset = 65
var fire = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Player = get_node("../Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	if !fire:
		self.scale *= 1.01
		offset += 0.5
		var mousePos = get_global_mouse_position()
		var selfPos = self.global_position
		if (abs(mousePos.x - selfPos.x) > 0.01):
			self.global_position = Player.global_position
			self.rotation = Player.get_node("Marker2D").rotation
			self.rotation_degrees -= 25
			self.global_position.x += cos(deg_to_rad(self.rotation_degrees - 90)) * offset
			self.global_position.y += sin(deg_to_rad(self.rotation_degrees - 90)) * offset
	else:
		velocity = Vector2(cos(deg_to_rad(self.rotation_degrees - 90)), sin(deg_to_rad(self.rotation_degrees - 90))) * SPEED * delta
		move_and_slide()
		
		
func _on_area_2d_body_entered(body):
	body.queue_free()


func _on_timer_timeout():
	fire = true
