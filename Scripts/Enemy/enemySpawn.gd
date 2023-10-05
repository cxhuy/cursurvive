extends Node2D

const SPAWN_RADIUS = 800 # enemies will be spawned within this distance from the player
const SPAWN_LIMIT = 300 # enemies will be spawned outside this distance from the player

var enemy = preload("res://Scenes/enemy.tscn")
var Player

func _ready():
	Player = get_node("../Player")


func _on_timer_timeout():
	var spawnedEnemy = enemy.instantiate()
	
	var spawnPos = Vector2.ZERO
	var validSpawn = false
	
	while !validSpawn:
#		spawnPos.x = clamp(Player.global_position.x + randi_range(-SPAWN_RADIUS, SPAWN_RADIUS), 0, get_viewport_rect().size.x)
#		spawnPos.y = clamp(Player.global_position.y + randi_range(-SPAWN_RADIUS, SPAWN_RADIUS), 0, get_viewport_rect().size.y)
		spawnPos.x = randi_range(0 + 50, get_viewport_rect().size.x - 50)
		spawnPos.y = randi_range(0 + 50, get_viewport_rect().size.y - 50)
		if SPAWN_LIMIT < spawnPos.distance_to(Player.global_position) and \
		spawnPos.distance_to(Player.global_position) < SPAWN_RADIUS:
			validSpawn = true

	spawnedEnemy.position = spawnPos
	add_child(spawnedEnemy)
