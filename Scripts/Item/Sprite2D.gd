extends Sprite2D

const itemPaths = ["res://Sprites/Items/pointer_item.png"]

var imagePath
var rotationSpeed

func _ready():
	imagePath = itemPaths[get_node("..").itemId]
	if imagePath:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "scale", Vector2(2, 2), 0.2)	
		var texture = load(imagePath)
		self.texture = texture
	rotationSpeed = randf_range(-0.5, 0.5)
		
		
func _process(delta):
	rotation_degrees += rotationSpeed
