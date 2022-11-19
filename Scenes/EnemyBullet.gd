extends KinematicBody2D

var vel = Vector2()
var speed = 100
var direction = 1

func _physics_process(delta):
	if direction == 1:
		vel.y += 100
	if direction == -1:
		vel.y -= 100
	vel.y = speed*direction
	vel = move_and_slide(vel, Vector2.UP)
	if Input.is_action_just_pressed("parry"):
		if Node.name == "EnemyBullet":
			direction = -1