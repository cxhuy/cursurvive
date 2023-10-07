extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2)	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
