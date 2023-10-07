extends Sprite2D

const itemNames = ["pointer","dvd", "busy"]

var imagePath
var rotationSpeed

func _ready():
	imagePath = "res://Sprites/Items/" + itemNames[get_node("..").itemId] + "_item.png"
	if imagePath:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "scale", Vector2(2, 2), 0.2)	
		var texture = load(imagePath)
		self.texture = texture
	self.rotation = randi_range(0, 360)
	rotationSpeed = randf_range(-0.5, 0.5)
		
		
func _process(delta):
	rotation_degrees += rotationSpeed
