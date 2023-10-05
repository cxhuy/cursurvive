extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mousePos = get_global_mouse_position()
	var selfPos = self.global_position
	if (abs(mousePos.x - selfPos.x) > 0.01):
		look_at(mousePos)
		rotation_degrees += 105
