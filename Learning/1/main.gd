extends Node2D


var goblin = preload("res://Learning/1/Enemies/goblin/goblin.tscn")
var screen_size # Size of the game window.

var rng = RandomNumberGenerator.new()
@onready var timer = 1
@onready var total_timer = 0

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	total_timer += delta
	timer -= delta
	if timer < 0:
		var gobby = goblin.instantiate()
		add_child(gobby)
		gobby.position = getRandPos()
		timer = .1
		
func getRandPos():
	var p = Vector2.ZERO
	var side = rng.randi_range(0, 1)
	var flip = rng.randi_range(0, 1)
	if side:
		if flip:
			p.x = screen_size.x
			p.y = rng.randf_range(0, screen_size.y)
		else:
			p.y = rng.randf_range(0, screen_size.y)
	else:
		if flip:
			p.y = screen_size.y
			p.x = rng.randf_range(0, screen_size.x)
		else:
			p.x = rng.randf_range(0, screen_size.x)
	return p
