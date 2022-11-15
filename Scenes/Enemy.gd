extends KinematicBody2D





func _on_Area2D_area_entered(area:Area2D):
	if area.name == "PlayerBulletHit":
		queue_free()