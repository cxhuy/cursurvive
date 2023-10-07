extends Sprite2D

var discNames = ["DVD-R", "DVD-RAM", "DVD-ROM", "DVD-RW"]

# Called when the node enters the scene tree for the first time.
func _ready():
	var discName = "res://Sprites/Attacks/DVD/" + discNames[randi_range(0, discNames.size() - 1)] + ".png"
	var newTexture = load(discName)
	texture = newTexture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotation_degrees += 10
