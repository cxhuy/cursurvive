extends Node2D

var item = preload("res://Scenes/item.tscn")

func _ready():
	for i in range(3):
		addItem()
	
	
func addItem():
	var itemInstance = item.instantiate()
	
	itemInstance.itemId = randi_range(0, 5)
	itemInstance.position = \
	Vector2(randi_range(50, get_viewport_rect().size.x) - 50, randi_range(50, get_viewport_rect().size.y) - 50)
	call_deferred("add_child", itemInstance)
	
