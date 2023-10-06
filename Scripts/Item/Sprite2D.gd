extends Sprite2D

const itemNames = ["pointer_item","dvd_item"]

var imagePath
var rotationSpeed

func _ready():
	imagePath = "res://Sprites/Items/" + itemNames[get_node("..").itemId] + ".png"
	if imagePath:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "scale", Vector2(2, 2), 0.2)	
		var texture = load(imagePath)
		self.texture = texture
	rotationSpeed = randf_range(-0.5, 0.5)
		
		
func _process(delta):
	rotation_degrees += rotationSpeed
