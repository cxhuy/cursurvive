extends Sprite2D

const itemPaths = ["res://Sprites/Items/pointer_item.png"]

var imagePath

func _ready():
	imagePath = itemPaths[get_node("..").itemId]
	if imagePath:
		self.scale = Vector2(2, 2)		
		var texture = load(imagePath)
		self.texture = texture
