extends Area2D

var direction
var speed = 90
var lifetime = 1

@onready var _animated_sprite = $AnimatedSprite2D

func setup(d=null):
	print("SET UP CALLED")
	direction = d
	

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("fireball")
	print("Starting position")
	print(position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	lifetime -= delta
	if lifetime < 0:
		queue_free()
		
	if direction != null:
		position += direction * speed * delta
		
		
