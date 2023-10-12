extends Sprite2D

const itemNames = ["pointer","dvd", "busy", "mine", "trash", "shield", "firewall"]

@onready var imagePath = "res://Sprites/Items/" + itemNames[get_node("..").itemId] + "_item.png"

var rotationSpeed = randf_range(-0.5, 0.5)


func _ready(): 
	if imagePath:
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(2, 2), 0.2)	
		var itemImage = load(imagePath)
		self.texture = itemImage
		
	self.rotation = randi_range(0, 360)
		
		
func _process(delta):
	rotation_degrees += rotationSpeed
