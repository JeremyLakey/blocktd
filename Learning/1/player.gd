extends Area2D

@export var speed = 50 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@onready var _animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position.x = screen_size.x / 2
	position.y = screen_size.y / 2
	print(str(screen_size))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	var directionX = Input.get_axis("ui_left", "ui_right")
	var directionY = Input.get_axis("ui_up", "ui_down")
	velocity.x = directionX
	velocity.y = directionY
	
	if velocity.length() > 0:
		
		_animated_sprite.play("run")
		velocity = velocity.normalized() * speed
		position += velocity * delta
		position = position.clamp(Vector2.ZERO, screen_size)
	else:
		_animated_sprite.play("idle")
