extends RigidBody2D

@onready var Game = get_node("../..")

var pointer = preload("res://Scenes/Attacks/pointer.tscn")
var dvd = preload("res://Scenes/Attacks/dvd.tscn")
var busy = preload("res://Scenes/Attacks/busy.tscn")
var mine = preload("res://Scenes/Attacks/mine_sweeper.tscn")
var trash = preload("res://Scenes/Attacks/trash.tscn")
var shields = preload("res://Scenes/Attacks/shields.tscn")

var itemId
var velocity = Vector2(randi_range(-50, 50), randi_range(-50, 50))


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		

func _on_area_2d_body_entered(body):
	var itemToUse
	
	if body.name == "Player":
		match itemId:
			0: # Pointer attack
				itemToUse = pointer.instantiate()
				
			1: # Dvd attack
				itemToUse = dvd.instantiate()
				itemToUse.global_position = self.global_position	
					
			2: # Busy attack
				itemToUse = busy.instantiate()
				itemToUse.global_position = self.global_position
				
			3: # Mine attack
				itemToUse = mine.instantiate()
				itemToUse.global_position = self.global_position
				
			4: # Trash attack
				itemToUse = trash.instantiate()
				itemToUse.global_position = self.global_position
				
			5: # Shield attack
				itemToUse = shields.instantiate()
				itemToUse.global_position = self.global_position				
	
	Game.call_deferred("add_child", itemToUse)
	Game.get_node("Items").addItem()
	self.queue_free()
