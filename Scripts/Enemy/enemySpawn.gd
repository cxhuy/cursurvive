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
	var patternId = randi_range(0, 2)
	
	match patternId:
		0: # Circle of enemies
			const enemyCountVars = [12, 18, 24, 30, 36]
			
			var enemyCount = enemyCountVars[randi() % enemyCountVars.size()]
			var circleRadius = enemyCount * 5
			var circleCenterPos = findRandValidSpawn(circleRadius)
			var enemySpawnPos = Vector2.ZERO
			var validSpawn = false
			var enemyToSpawn
					
			for i in range(enemyCount):
				enemyToSpawn = enemy.instantiate()
				enemySpawnPos.x = \
					circleCenterPos.x + sin(deg_to_rad(i * 360 / enemyCount)) * circleRadius
				enemySpawnPos.y = \
					circleCenterPos.y + cos(deg_to_rad(i * 360 / enemyCount)) * circleRadius
				enemyToSpawn.global_position = enemySpawnPos
				enemyToSpawn.SPEED = 12000				
				add_child(enemyToSpawn)
				
		1: # Circle around player
			const enemyCount = 20
			const circleRadius = 600
			
			var circleCenterPos = Player.global_position
			var enemySpawnPos = Vector2.ZERO
			var enemyToSpawn
					
			for i in range(enemyCount):
				enemyToSpawn = enemy.instantiate()
				enemySpawnPos.x = \
					circleCenterPos.x + sin(deg_to_rad(i * 360 / enemyCount)) * circleRadius
				enemySpawnPos.y = \
					circleCenterPos.y + cos(deg_to_rad(i * 360 / enemyCount)) * circleRadius
				enemyToSpawn.global_position = enemySpawnPos
				enemyToSpawn.SPEED = 8000
				enemyToSpawn.get_node("MoveDelay").wait_time = 2
				add_child(enemyToSpawn)
			
		2: # Arrow that flies towards player:
			const enemyCount = 7
			const arrowAngle = 20
			
			var arrowPoint = findRandValidSpawn()
			var enemySpawnPos = arrowPoint		
			var enemyRotation	
			var enemyToSpawn = enemy.instantiate()
			
			enemyToSpawn.global_position = enemySpawnPos	
			add_child(enemyToSpawn)
			enemyToSpawn.look_at(Player.global_position)	
			enemyRotation = enemyToSpawn.rotation_degrees														
				
			var addLine = func(angle):
				for i in range(enemyCount):
					enemyToSpawn = enemy.instantiate()
					enemySpawnPos = arrowPoint
					enemySpawnPos.x += cos(deg_to_rad(enemyRotation + angle + 180)) * 30 * i
					enemySpawnPos.y += sin(deg_to_rad(enemyRotation + angle + 180)) * 30 * i
					enemyToSpawn.global_position = enemySpawnPos
					enemyToSpawn.rotation_degrees = enemyRotation
					add_child(enemyToSpawn)
					
			addLine.call(arrowAngle)
			addLine.call(-arrowAngle)
				
			
func findRandValidSpawn(additionalRange = 0):
	var validSpawnPos = Vector2.ZERO
	while true:
		validSpawnPos.x = randi_range(0 + 50, get_viewport_rect().size.x - 50)
		validSpawnPos.y = randi_range(0 + 50, get_viewport_rect().size.y - 50)
		
		if SPAWN_LIMIT + additionalRange < validSpawnPos.distance_to(Player.global_position) \
		and validSpawnPos.distance_to(Player.global_position) < SPAWN_RADIUS + additionalRange:
			return validSpawnPos
