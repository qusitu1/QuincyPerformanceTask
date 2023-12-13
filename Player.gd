extends Area2D

@export var Speed = 400.0
@onready var bg_music = $"../BGmusic"
@onready var enemy_hit = $"../EnemyHit"

func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
		
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		
	if Input.is_action_pressed("down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * Speed
	
	position += velocity * delta


func _on_body_entered(body):
	hide()
	enemy_hit.play()
	bg_music.stop()


