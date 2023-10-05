extends RigidBody2D

var itemId
var Player
var Game
var pointer = preload("res://Scenes/pointer.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
#	Player = get_node("../../Player")
	Game = get_node("../..")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		match itemId:
			0: # Pointer attack
				var pointerInstance = pointer.instantiate()
				Game.add_child(pointerInstance)
	Game.get_node("Items").addItem()
	self.queue_free()
