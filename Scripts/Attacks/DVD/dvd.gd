extends Node2D

const DISC_NUM = 2

var disc = preload("res://Scenes/disc.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0.5, 0.5), 0.2)	
	await get_tree().create_timer(0.5).timeout
	
	var discInstance
	for i in range(DISC_NUM):
		discInstance = disc.instantiate()
		discInstance.global_position = self.global_position	
		get_node("../").add_child(discInstance)
		await get_tree().create_timer(1).timeout
		
	tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(0, 0), 0.1)
	tween = get_tree().create_tween()
	await get_tree().create_timer(0.1).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
