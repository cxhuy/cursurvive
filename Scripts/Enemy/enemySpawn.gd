extends Node2D

const SPAWN_RADIUS = 800 # enemies will be spawned within this distance from the player
const SPAWN_LIMIT = 300 # enemies will be spawned outside this distance from the player

@onready var Player = get_node("../Player")

var enemy = preload("res://Scenes/enemy.tscn")
var timeCount = 0
var patternTime = randi_range(5, 10)
var level = 0


func _process(delta):
	var currentTimeSec = Time.get_ticks_msec() / 1000
	if currentTimeSec > level and get_node("Timer").wait_time >= 0.2:
		level = currentTimeSec
		get_node("Timer").wait_time -= 0.01
		

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
	var patternId = randi_range(1, 1)
	
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
			const enemyCount = 15
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
				enemyToSpawn = enemy.instantiate()
				enemySpawnPos.x = \
					circleCenterPos.x + sin(deg_to_rad(i * 360 / enemyCount)) * circleRadius * 1.1
				enemySpawnPos.y = \
					circleCenterPos.y + cos(deg_to_rad(i * 360 / enemyCount)) * circleRadius * 1.1
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
					enemyToSpawn.followPlayer = false
					enemyToSpawn.SPEED = 50000
					enemyToSpawn.get_node("MoveDelay").wait_time = 1.2					
					add_child(enemyToSpawn)
					
			addLine.call(arrowAngle)
			addLine.call(-arrowAngle)
			
		3: # Walls
			const spawnGap = 80
			var wallPattern = randi_range(0, 2)
			var enemyToSpawn
			
			if wallPattern == 0 or wallPattern == 2: # Up, Down 
				for i in range(get_viewport_rect().size.x / spawnGap):
					enemyToSpawn = enemy.instantiate()
					enemyToSpawn.global_position = Vector2(i * spawnGap + 20, 20)
					enemyToSpawn.rotation_degrees = 90
					enemyToSpawn.followPlayer = false
					enemyToSpawn.SPEED = 5000
					enemyToSpawn.get_node("MoveDelay").wait_time = 1.5	
					add_child(enemyToSpawn)
					enemyToSpawn = enemy.instantiate()
					enemyToSpawn.global_position = Vector2(i * spawnGap + 20 + spawnGap / 2, \
					get_viewport_rect().size.y - 20)
					enemyToSpawn.rotation_degrees = -90
					enemyToSpawn.followPlayer = false
					enemyToSpawn.SPEED = 5000
					enemyToSpawn.get_node("MoveDelay").wait_time = 1.5	
					add_child(enemyToSpawn)
					
			if wallPattern == 1 or wallPattern == 2: # Left, Right 
				for i in range(get_viewport_rect().size.y / spawnGap):
					enemyToSpawn = enemy.instantiate()
					enemyToSpawn.global_position = Vector2(20, i * spawnGap + 20)
					enemyToSpawn.rotation_degrees = 0
					enemyToSpawn.followPlayer = false
					enemyToSpawn.SPEED = 5000
					enemyToSpawn.get_node("MoveDelay").wait_time = 1.5	
					add_child(enemyToSpawn)
					enemyToSpawn = enemy.instantiate()
					enemyToSpawn.global_position = Vector2(get_viewport_rect().size.x - 20, \
					i * spawnGap + 20 + spawnGap / 2)
					enemyToSpawn.rotation_degrees = 180
					enemyToSpawn.followPlayer = false
					enemyToSpawn.SPEED = 5000
					enemyToSpawn.get_node("MoveDelay").wait_time = 1.5	
					add_child(enemyToSpawn)
					
		4: # Stream of enemies towards players
			const streamCount = 40
			const turretCount = 30
			const turretRadius = 40

			var streamCenter = findRandValidSpawn()
			var enemyToSpawn
			
			for i in range(turretCount):
				enemyToSpawn = enemy.instantiate()
				enemyToSpawn.global_position = Vector2( \
				streamCenter.x + sin(deg_to_rad(i * 360 / turretCount)) * turretRadius, \
				streamCenter.y + cos(deg_to_rad(i * 360 / turretCount)) * turretRadius)
				enemyToSpawn.SPEED = 8000
				enemyToSpawn.get_node("MoveDelay").wait_time = 4
				add_child(enemyToSpawn)
				
			await get_tree().create_timer(1).timeout

			for i in range(streamCount):
				enemyToSpawn = enemy.instantiate()
				enemyToSpawn.global_position = streamCenter
				enemyToSpawn.followPlayer = false
				enemyToSpawn.SPEED = 25000
				enemyToSpawn.get_node("MoveDelay").wait_time = 0.1
				add_child(enemyToSpawn)
				enemyToSpawn.look_at(Player.global_position)
				await get_tree().create_timer(0.05).timeout
				
			
func findRandValidSpawn(additionalRange = 0):
	var validSpawnPos = Vector2.ZERO
	while true:
		validSpawnPos.x = randi_range(0 + 50, get_viewport_rect().size.x - 50)
		validSpawnPos.y = randi_range(0 + 50, get_viewport_rect().size.y - 50)
		
		if SPAWN_LIMIT + additionalRange < validSpawnPos.distance_to(Player.global_position) \
		and validSpawnPos.distance_to(Player.global_position) < SPAWN_RADIUS + additionalRange:
			return validSpawnPos
