extends StaticBody2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		if randi() % 15 == 0:  # 2,5% Chance ??
			var item = preload("res://scenes/ghost_item.tscn").instantiate()
			item.global_position = global_position
			get_tree().current_scene.add_child(item)
		queue_free()
