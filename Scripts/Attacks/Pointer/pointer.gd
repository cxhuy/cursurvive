extends CharacterBody2D

const SPEED = 50000

@onready var Player = get_node("../Player")

var offset = 65
var fire = false


func _ready():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(10, 10), 1)	
	
	
func _physics_process(delta):
	if !fire:
		offset += 1.3
		if (abs(get_global_mouse_position().x - self.global_position.x) > 0.01):
			self.global_position = Player.global_position
			self.rotation = Player.get_node("Marker2D").rotation
			self.rotation_degrees -= 25
			self.global_position.x += cos(deg_to_rad(self.rotation_degrees - 90)) * offset
			self.global_position.y += sin(deg_to_rad(self.rotation_degrees - 90)) * offset
			
	else:
		self.velocity = Vector2( \
		cos(deg_to_rad(self.rotation_degrees - 90)), sin(deg_to_rad(self.rotation_degrees - 90))) \
		* SPEED * delta
		move_and_slide()
		
		
func _on_area_2d_body_entered(body):
	body.queue_free()


func _on_timer_timeout():
	fire = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	if fire: # Prevents pointer from freeing during aiming
		queue_free()
		
