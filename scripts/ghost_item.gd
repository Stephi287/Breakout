extends Area2D

func _process(delta: float) -> void:
	position.y += 100 * delta  # Item fällt runter

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Bar":
		var audio = $AudioStreamPlayer2D
		audio.play()
		$Sprite.visible = false
		activate_effect()
		
		await audio.finished
		queue_free()

func activate_effect():
	var bricks := get_tree().get_nodes_in_group("brick")
	var shapes := []

	for brick in bricks:
		var shape = brick.get_node_or_null("CollisionShape2D")
		if shape != null:
			shapes.append(shape)

	await get_tree().process_frame  # Jetzt ist Ball draußen aus Kollision

	# Jetzt deaktivieren – kein Risiko mehr für freed-Objekte
	for shape in shapes:
		if is_instance_valid(shape):
			shape.disabled = true
	
	var ball := get_tree().get_nodes_in_group("ball")
	for b in ball:
		var ball_sprite = b.get_node("Sprite")
		ball_sprite.modulate = Color(1, 1, 1, 0.3)
	
	var timer = get_tree().create_timer(2)
	timer.timeout.connect(func():
		for shape in shapes:
			if is_instance_valid(shape):
				shape.disabled = false
				for b in ball:
					var ball_sprite = b.get_node("Sprite")
					ball_sprite.modulate = Color(1, 1, 1, 1)
	)
