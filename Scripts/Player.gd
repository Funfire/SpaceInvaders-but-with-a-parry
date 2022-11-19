extends KinematicBody2D


onready var bullet = preload("res://Scenes/PlayerBullet.tscn")
export (int) var SPEED = 300

func _physics_process(delta):
	shoot()
	var velocity = Vector2()
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	velocity = velocity.normalized()
	move_and_slide(velocity*SPEED)

func shoot():
	if Input.is_action_just_pressed("shoot"):
		var b = bullet.instance()
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position