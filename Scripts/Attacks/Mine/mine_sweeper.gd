extends Node2D

const MINE_NUM = 3

var mine = preload("res://Scenes/Attacks/mine.tscn")

func _ready():
	# Prevents MineSweeper from going outside the screen
	var viewport_x = get_viewport_rect().size.x
	var viewport_y = get_viewport_rect().size.y
	var texture_width = get_node("MineSweeperSprite").texture.get_width()
	var texture_height = get_node("MineSweeperSprite").texture.get_height()
	self.global_position.x = \
	clamp(self.global_position.x, texture_width / 2, viewport_x - texture_width / 2)
	self.global_position.y = \
	clamp(self.global_position.y, texture_height / 2, viewport_y - texture_height / 2)
	
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.2)	
	await get_tree().create_timer(0.5).timeout
	
	var mineInstance
	var mineSpawnPos_x
	var mineSpawnPos_y
	
	for i in range(MINE_NUM):
		mineInstance = mine.instantiate()
		mineSpawnPos_x = randi_range(0 + 50, get_viewport_rect().size.x - 50)
		mineSpawnPos_y = randi_range(0 + 50, get_viewport_rect().size.y - 50)
		mineInstance.global_position = Vector2(mineSpawnPos_x, mineSpawnPos_y)
		get_node("../").add_child(mineInstance)
		await get_tree().create_timer(0.3).timeout
		
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0, 0), 0.1)
	await get_tree().create_timer(0.1).timeout
	self.queue_free()
