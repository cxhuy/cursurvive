extends CharacterBody2D

const SPEED = 10000

var Player
var canMove = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.3)	
	Player = get_node("../../Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	look_at(Player.global_position)	
	if canMove:
		velocity = Vector2(cos(rotation), sin(rotation)) * SPEED * delta
		move_and_slide()
	

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		Player.death()


func _on_timer_timeout():
	canMove = true
	get_node("Area2D/CollisionShape2D").disabled = false
	get_node("CollisionShape2D").disabled = false
