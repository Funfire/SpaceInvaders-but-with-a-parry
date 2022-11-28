extends KinematicBody2D

onready var bullet = preload("res://Scenes/EnemyBullet.tscn")
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




func _on_Timer_timeout():
	canShoot = true



func _on_Area2D_area_entered(area:Area2D):
	if area.name == "PlayerBulletHit":
		queue_free()
