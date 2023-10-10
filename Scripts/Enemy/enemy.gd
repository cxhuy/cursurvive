extends CharacterBody2D

var SPEED = 10000

@onready var Player = get_node("../../Player")
var canMove = false


func _ready():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.3)	
	
	
func _physics_process(delta):
	look_at(Player.global_position)	
	
	if canMove:
		self.velocity = Vector2(cos(self.rotation), sin(self.rotation)) * SPEED * delta
		move_and_slide()
	

func _on_area_2d_body_entered(body):
	if body.name == "Player": 
		Player.death()


func _on_timer_timeout():
	# Enemy does not move or interact until timer is triggered
	canMove = true
