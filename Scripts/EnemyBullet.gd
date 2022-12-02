extends KinematicBody2D

var vel = Vector2()
var speed = 300
var direction = 1

func _physics_process(delta):
	if direction == 1:
		vel.y += 100
	if direction == -1:
		vel.y -= 100
	vel.y = speed*direction
	vel = move_and_slide(vel, Vector2.UP)



func _on_EnemyBulletHit_area_entered(area:Area2D):
		while area.name == "ParryZone":
			print("in zone")
			yield(get_tree(), "idle_frame")
			if Input.is_action_just_pressed("parry"):
				direction = -1
				speed = 500
		if area.name == "EnemyHurtbox":
			queue_free()

