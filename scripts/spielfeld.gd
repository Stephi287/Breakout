extends Node2D

var punkte = 0
var dead = false
var not_started = true
@onready var music_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var music_player2: AudioStreamPlayer2D = $AudioStreamPlayer2D2

func _ready() -> void:
	music_player2.play()
	$Elemente/CanvasLayer/Control/Label2.visible = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("Space") and not_started:
		$Elemente/CanvasLayer/Control/Label2.visible = false
		not_started = false
	if Input.is_action_pressed("Enter") and dead:
		get_tree().reload_current_scene()

func _on_ball_body_entered(body: Node) -> void:
	if body.name == "Bar" or body.name == "Bar2":
		punkte += 1
		$Elemente/CanvasLayer/Control/Label.text = str(punkte) 


func _on_punkte_bereich_body_entered(body: Node2D) -> void:
	music_player.play()
	$Elemente/Ball.freeze = true
	$Elemente/Ball/CPUParticles2D.emitting = false
	dead = true
	$Elemente/CanvasLayer/Control/Label3.text = "YOUR SCORE: " + str(punkte) + "\nPRESS ENTER TO TRY AGAIN"
	$Elemente/CanvasLayer/Control/Label3.visible = true
	


func _on_punkte_bereich_2_body_entered(body: Node2D) -> void:
	music_player.play()
	$Elemente/Ball.freeze = true
	$Elemente/Ball/CPUParticles2D.emitting = false
	dead = true
	$Elemente/CanvasLayer/Control/Label3.text = "YOUR SCORE: " + str(punkte) + "\nPRESS ENTER TO TRY AGAIN"
	$Elemente/CanvasLayer/Control/Label3.visible = true
