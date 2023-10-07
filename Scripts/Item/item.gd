extends RigidBody2D

var itemId
var Player
var Game
var pointer = preload("res://Scenes/pointer.tscn")
var dvd = preload("res://Scenes/dvd.tscn")
var busy = preload("res://Scenes/busy.tscn")
var velocity = Vector2(randi_range(-50, 50), randi_range(-50, 50))

# Called when the node enters the scene tree for the first time.
func _ready():
#	Player = get_node("../../Player")
	Game = get_node("../..")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		match itemId:
			0: # Pointer attack
				var pointerInstance = pointer.instantiate()
				Game.add_child(pointerInstance)
			1: # Dvd attack
				var dvdInstance = dvd.instantiate()
				dvdInstance.global_position = self.global_position
				Game.add_child(dvdInstance)				
			2: # Busy attack
				var busyInstance = busy.instantiate()
				busyInstance.global_position = self.global_position
				Game.add_child(busyInstance)
	Game.get_node("Items").addItem()
	self.queue_free()
