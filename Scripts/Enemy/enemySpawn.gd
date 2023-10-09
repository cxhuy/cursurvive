extends Node2D

const SPAWN_RADIUS = 800 # enemies will be spawned within this distance from the player
const SPAWN_LIMIT = 300 # enemies will be spawned outside this distance from the player

@onready var Player = get_node("../Player")

var enemy = preload("res://Scenes/enemy.tscn")
var timeCount = 0
var patternTime = randi_range(5, 10)


func _on_timer_timeout():
	var enemyToSpawn = enemy.instantiate()
	var enemySpawnPos = Vector2.ZERO
	var validSpawn = false
	
	while !validSpawn:
		enemySpawnPos.x = randi_range(0 + 50, get_viewport_rect().size.x - 50)
		enemySpawnPos.y = randi_range(0 + 50, get_viewport_rect().size.y - 50)
		
		if SPAWN_LIMIT < enemySpawnPos.distance_to(Player.global_position) and \
		enemySpawnPos.distance_to(Player.global_position) < SPAWN_RADIUS:
			validSpawn = true

	enemyToSpawn.global_position = enemySpawnPos
	add_child(enemyToSpawn)
	
	if timeCount == patternTime:
		spawn_enemy_pattern()
		timeCount = 0
		patternTime = randi_range(5, 10)
		
	else:
		timeCount += 1
		

func spawn_enemy_pattern():
	var patternId = randi_range(0, 0)
	
	match patternId:
		0: # Circle of enemies
			const enemyCountVars = [12, 18, 24, 30, 36]
			
			var enemyCount = enemyCountVars[randi() % enemyCountVars.size()]
			var circleRadius = enemyCount * 5
			var circleCenterPos = Vector2.ZERO
			var enemySpawnPos = Vector2.ZERO
			var validSpawn = false
			var enemyToSpawn
			
			while !validSpawn:
				circleCenterPos.x = randi_range(0 + 50, get_viewport_rect().size.x - 50)
				circleCenterPos.y = randi_range(0 + 50, get_viewport_rect().size.y - 50)
				
				if SPAWN_LIMIT + circleRadius < circleCenterPos.distance_to(Player.global_position) \
				and circleCenterPos.distance_to(Player.global_position) < SPAWN_RADIUS + circleRadius:
					validSpawn = true
					
			for i in range(enemyCount):
				enemyToSpawn = enemy.instantiate()
				enemySpawnPos.x = \
					circleCenterPos.x + sin(deg_to_rad(i * 360 / enemyCount)) * circleRadius
				enemySpawnPos.y = \
					circleCenterPos.y + cos(deg_to_rad(i * 360 / enemyCount)) * circleRadius
				enemyToSpawn.global_position = enemySpawnPos
				add_child(enemyToSpawn)
