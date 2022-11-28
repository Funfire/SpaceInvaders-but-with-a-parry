extends KinematicBody2D

onready var bullet = preload("res://Scenes/EnemyBullet.tscn")
onready var enemy = load("res://Scenes/Enemy.tscn")
var canShoot = true

func _physics_process(delta):
	enemyShoot()


func enemyShoot():
	if canShoot == true:
		var b = bullet.instance()
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position
		$Timer.start()
		canShoot = false

func spawnEnemy():
	var e = enemy.instance()
	get_parent().add_child(e)
	e.position = Vector2(rand_range(33, 565), 119)




func _on_Timer_timeout():
	canShoot = true



func _on_Area2D_area_entered(area:Area2D):
	if area.name == "PlayerBulletHit" or area.name == "EnemyBulletHit":
		queue_free()
		spawnEnemy()
