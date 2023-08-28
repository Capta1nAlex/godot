extends Sprite2D

var direction = false

# Called when the node enters the scene tree for the first time.
func _ready():
	position.y += 40
	position.x += 60
	pass # Replace with function body.

func _physics_process(delta):
	position.x += 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
