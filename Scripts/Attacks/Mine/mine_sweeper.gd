extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_x = get_viewport_rect().size.x
	var viewport_y = get_viewport_rect().size.y
	var texture_width = get_node("MineSweeperSprite").texture.get_width()
	var texture_height = get_node("MineSweeperSprite").texture.get_height()
	self.global_position.x = \
	clamp(self.global_position.x, texture_width / 2, viewport_x - texture_width / 2)
	self.global_position.y = \
	clamp(self.global_position.y, texture_height / 2, viewport_y - texture_height / 2)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2)	
	await get_tree().create_timer(0.5).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
