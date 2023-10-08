extends Sprite2D

var discNames = ["DVD-R", "DVD-RAM", "DVD-ROM", "DVD-RW"]


func _ready():
	var discName = \
	"res://Sprites/Attacks/DVD/" + discNames[randi_range(0, discNames.size() - 1)] + ".png"
	var newTexture = load(discName)
	self.texture = newTexture


func _process(delta):
	self.rotation_degrees += 10
