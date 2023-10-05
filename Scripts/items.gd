extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var sceneInstance = preload("res://Scenes/item.tscn")
	var instance = sceneInstance.instantiate()
	instance.get_node("Sprite2D").imagePath = "res://Sprites/Items/pointer_item.png"
	instance.position = Vector2(200, 200)
	add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
