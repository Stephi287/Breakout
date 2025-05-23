extends StaticBody2D

var started = false

func _process(delta: float) -> void:
	var speed = 5
	if Input.is_action_pressed("Space"):
		started = true
	if Input.is_action_pressed("ui_left") and position.x >= 63 and started:
		position += Vector2.LEFT * speed
	if Input.is_action_pressed("ui_right") and position.x <= 580 and started:
		position += Vector2.RIGHT * speed
		
