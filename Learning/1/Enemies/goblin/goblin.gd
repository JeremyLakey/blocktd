extends Area2D

var speed = 50
@onready var target = get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if target:
		var direction = position.direction_to(target.position)
		position += direction * speed * delta
		
