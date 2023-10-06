extends Node2D

var sceneInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	sceneInstance = preload("res://Scenes/item.tscn")
	for i in range(3):
		addItem()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func addItem():
	var instance = sceneInstance.instantiate()
	instance.itemId = randi_range(0, 1)
	instance.position = Vector2(randi_range(50, get_viewport_rect().size.x) - 50, randi_range(50, get_viewport_rect().size.y) - 50)
	add_child(instance)
	
