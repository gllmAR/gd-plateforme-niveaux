extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Joueur:
		print("Jouer mort")
		get_tree().call_deferred("reload_current_scene")
