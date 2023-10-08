extends Marker2D


func _process(delta):
	var mousePos = get_global_mouse_position()

	if abs(mousePos.x - self.global_position.x) > 0.01: # Prevents player jittering
		look_at(mousePos)
		rotation_degrees += 105
