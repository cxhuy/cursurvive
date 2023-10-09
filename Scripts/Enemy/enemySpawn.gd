extends Node2D

const SPAWN_RADIUS = 800 # enemies will be spawned within this distance from the player
const SPAWN_LIMIT = 300 # enemies will be spawned outside this distance from the player

@onready var Player = get_node("../Player")

var enemy = preload("res://Scenes/enemy.tscn")
var timeCount = 0
var patternTime = randi_range(5, 10)


func _on_timer_timeout():
	var spawnedEnemy = enemy.instantiate()
	var spawnPos = Vector2.ZERO
	var validSpawn = false
	
	while !validSpawn:
		spawnPos.x = randi_range(0 + 50, get_viewport_rect().size.x - 50)
		spawnPos.y = randi_range(0 + 50, get_viewport_rect().size.y - 50)
		if SPAWN_LIMIT < spawnPos.distance_to(Player.global_position) and \
		spawnPos.distance_to(Player.global_position) < SPAWN_RADIUS:
			validSpawn = true

	spawnedEnemy.position = spawnPos
	add_child(spawnedEnemy)
	
	if timeCount == patternTime:
		spawn_enemy_pattern()
		timeCount = 0
		patternTime = randi_range(5, 10)
	else:
		timeCount += 1
		

func spawn_enemy_pattern():
	var pattern_id = randi_range(0, 0)
	match pattern_id:
		0: # Circle of enemies
			const enemyCountVars = [12, 18, 24, 30, 36]
			
			var enemyCount = enemyCountVars[randi() % enemyCountVars.size()]
			var radius = enemyCount * 5
			var centerPos = Vector2.ZERO
			var spawnPos = Vector2.ZERO
			var validSpawn = false
			var spawnedEnemy
			
			while !validSpawn:
				centerPos.x = randi_range(0 + 50, get_viewport_rect().size.x - 50)
				centerPos.y = randi_range(0 + 50, get_viewport_rect().size.y - 50)
				if SPAWN_LIMIT < centerPos.distance_to(Player.global_position) and \
				centerPos.distance_to(Player.global_position) < SPAWN_RADIUS:
					validSpawn = true
					
			for i in range(enemyCount):
				spawnedEnemy = enemy.instantiate()
				spawnPos.x = centerPos.x + sin(deg_to_rad(i * 360 / enemyCount)) * radius
				spawnPos.y = centerPos.y + cos(deg_to_rad(i * 360 / enemyCount)) * radius
				spawnedEnemy.global_position = spawnPos
				add_child(spawnedEnemy)
