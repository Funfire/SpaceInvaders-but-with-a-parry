extends Sprite


func _physics_process(delta):
	position.y -= 10



func _on_PlayerBulletHit_area_entered(area:Area2D):
	if area.name == "EnemyHurtbox":
		queue_free()