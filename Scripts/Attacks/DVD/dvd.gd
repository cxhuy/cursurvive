extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.scale = Vector2(0, 0)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0.5, 0.5), 0.2)	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
