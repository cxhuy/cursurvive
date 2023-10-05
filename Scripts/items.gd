extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var sceneInstance = preload("res://Scenes/item.tscn")
	var instance = sceneInstance.instantiate()
	instance.itemId = 0
	instance.position = Vector2(200, 200)
	add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
