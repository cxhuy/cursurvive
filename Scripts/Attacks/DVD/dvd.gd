extends Node2D

const DISC_NUM = 2

var disc = preload("res://Scenes/disc.tscn")


func _ready():
	# Prevents DVD from going outside the screen
	var viewport_x = get_viewport_rect().size.x
	var viewport_y = get_viewport_rect().size.y
	var texture_width = get_node("DvdSprite").texture.get_width() * get_node("DvdSprite").scale.x
	var texture_height = get_node("DvdSprite").texture.get_height() * get_node("DvdSprite").scale.y
	self.global_position.x = \
	clamp(self.global_position.x, texture_width / 2, viewport_x - texture_width / 2)
	self.global_position.y = \
	clamp(self.global_position.y, texture_height / 2, viewport_y - texture_height / 2)
	
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2)	
	await get_tree().create_timer(0.5).timeout
	
	var discInstance
	for i in range(DISC_NUM):
		discInstance = disc.instantiate()
		discInstance.global_position = self.global_position	
		get_node("../").add_child(discInstance)
		await get_tree().create_timer(1).timeout
		
	tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0, 0), 0.1)
	await get_tree().create_timer(0.1).timeout
	self.queue_free()
