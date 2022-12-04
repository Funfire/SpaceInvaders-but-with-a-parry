extends Timer

onready var enemy = preload("res://Scenes/Enemy.tscn")
var count = 1
var canSpawn = true


func spawnEnemy():
	if canSpawn == true:
		var e = enemy.instance()
		get_parent().add_child(e)
		e.position = Vector2(rand_range(33, 565), 119)


func _physics_process(delta):
	if count == 7:
		canSpawn = false

func _on_Timer_timeout():
	spawnEnemy()
	count += 1
	$".".start()