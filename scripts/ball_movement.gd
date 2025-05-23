extends RigidBody2D

var not_started = true
@onready var music_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var particle_system: CPUParticles2D = $CPUParticles2D

func _ready():
	print("Ball ready")

	# Variante 1: apply_impulse (klassisch)
	#apply_impulse(Vector2(200, -300))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Space") and not_started:
		apply_central_impulse(Vector2(300, -300))
		particle_system.emitting = true
		not_started = false

func _on_body_entered(body: Node) -> void:
	if linear_velocity.length() < 300:
		apply_central_impulse(linear_velocity.normalized() * 10)
	
	if linear_velocity.normalized().y > 0.95:
		apply_central_impulse(Vector2(-50, 0))
		
	if linear_velocity.normalized().x > 0.95:
		apply_central_impulse(Vector2(-50, 0))
	
	if body.is_in_group("brick"):
		$AudioStreamBrick.play()
	else: 
		music_player.play()
		
