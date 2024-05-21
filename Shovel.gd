extends TextureButton

var is_visible = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Shovel.is_visible:
		visible = true
	else:
		Shovel.visible = false
		visible = false

func show():
	visible = true

func hide():
	visible = false
