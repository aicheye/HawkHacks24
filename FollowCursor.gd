extends Sprite


var sel = -1
var is_visible = true


# Called when the node enters the scene tree for the first time.
func _ready():
	var mouse_position = get_global_mouse_position()
	var offset_pos = Vector2(mouse_position.x, mouse_position.y - 58)
	position = offset_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mouse_position = get_global_mouse_position()
	var offset_pos = Vector2(mouse_position.x, mouse_position.y - 58)
	if FollowCursor.is_visible:
		FollowCursor.visible = true
		visible = true
	else:
		FollowCursor.visible = false
		FollowCursor.texture = load("res://resources/Nothing.png")
		visible = false
		texture = load("res://resources/Nothing.png")
	position = offset_pos

func _on_TextureButton1_pressed():
	texture = load("res://resources/Daisy.png")
	FollowCursor.is_visible = true
	FollowCursor.visible = true
	visible = true
	FollowCursor.sel = 0

func _on_TextureButton2_pressed():
	texture = load("res://resources/Lily.png")
	FollowCursor.is_visible = true
	FollowCursor.visible = true
	visible = true
	FollowCursor.sel = 1

func _on_TextureButton3_pressed():
	texture = load("res://resources/Sunflower.png")
	FollowCursor.is_visible = true
	FollowCursor.visible = true
	visible = true
	FollowCursor.sel = 2

func _on_TextureButton4_pressed():
	texture = load("res://resources/Tulip.png")
	FollowCursor.is_visible = true
	FollowCursor.visible = true
	visible = true
	FollowCursor.sel = 3

func get_sel():
	return sel

func reset_sel():
	texture = load("res://resources/Nothing.png")
	FollowCursor.is_visible = false
	FollowCursor.visible = false;
	FollowCursor.texture = load("res://resources/Nothing.png")
	print("confirm")
	FollowCursor.sel = -1
	print(sel)
