extends CharacterBody2D

var SPEED = 10000

@onready var Player = get_node("../../Player")
var canMove = false
var canKill = false
var followPlayer = true


func _ready():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.3)	
	await get_tree().create_timer(1).timeout
	canKill = true
	
	
func _physics_process(delta):
	if followPlayer:
		look_at(Player.global_position)	
	
	if canMove:
		self.velocity = Vector2(cos(self.rotation), sin(self.rotation)) * SPEED * delta
		move_and_slide()
	

func _on_area_2d_body_entered(body):
	if body.name == "Player" and canKill: 
		Player.death()


func _on_timer_timeout():
	# Enemy does not move or interact until timer is triggered
	canMove = true
