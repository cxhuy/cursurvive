extends Sprite2D

var imagePath

func _ready():
	if imagePath:
		var texture = load(imagePath)
		self.texture = texture
