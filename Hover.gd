extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var map_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_position = get_global_mouse_position()
	var local_position = to_local(mouse_position)
	var map_position = world_to_map(local_position)
	
	clear()
	
	if 5 <= map_position.x and map_position.x <= 8 and -3 <= map_position.y and map_position.y <= 0:
		set_cellv(map_position, 11)
