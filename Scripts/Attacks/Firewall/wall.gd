extends Node2D


func _on_attack_range_body_entered(body):
	body.queue_free()


func _on_duration_timeout():
	self.queue_free()
