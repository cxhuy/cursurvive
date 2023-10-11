extends Node2D

var sceneInstance = preload("res://Scenes/item.tscn")

func _ready():
	for i in range(3):
		addItem()
	
	
func addItem():
	var instance = sceneInstance.instantiate()
	
	instance.itemId = randi_range(0, 5)
	instance.position = \
	Vector2(randi_range(50, get_viewport_rect().size.x) - 50, randi_range(50, get_viewport_rect().size.y) - 50)
	call_deferred("add_child", instance)
	
