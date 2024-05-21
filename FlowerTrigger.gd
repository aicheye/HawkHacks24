extends TileMap

var plants = []
var stages = []
var deltas = []
var looking_for_shovel = false
var shovel_pressed = false
var dig

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(4):
		plants.append([])
		stages.append([])
		deltas.append([])
	for i in range(4):
		for j in range(4):
			plants[i].append(-1)
			stages[i].append(-1)
			deltas[i].append(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	clear()
	for i in range(4):
		for j in range(4):
			if stages[i][j] != -1:
				if stages[i][j] == 0:
					set_cell(i+3, j-5, 17)
				elif plants[i][j] == 0 and stages[i][j] == 1:
					set_cell(i+3, j-5, 13)
				elif plants[i][j] == 0 and stages[i][j] == 2:
					set_cell(i+3, j-5, 19)
				elif plants[i][j] == 0 and stages[i][j] < 6:
					set_cell(i+3, j-5, 35)
				elif plants[i][j] == 0 and stages[i][j] >= 6:
					set_cell(i+3, j-5, 21)
				elif plants[i][j] == 1 and stages[i][j] == 1:
					set_cell(i+3, j-5, 22)
				elif plants[i][j] == 1 and stages[i][j] == 2:
					set_cell(i+3, j-5, 24)
				elif plants[i][j] == 1 and stages[i][j] < 6:
					set_cell(i+3, j-5, 25)
				elif plants[i][j] == 1 and stages[i][j] >= 6:
					set_cell(i+3, j-5, 26)
				elif plants[i][j] == 2 and stages[i][j] == 1:
					set_cell(i+3, j-5, 27)
				elif plants[i][j] == 2 and stages[i][j] == 2:
					set_cell(i+3, j-5, 28)
				elif plants[i][j] == 2 and stages[i][j] < 6:
					set_cell(i+3, j-5, 29)
				elif plants[i][j] == 2 and stages[i][j] >= 6:
					set_cell(i+3, j-5, 30)
				elif plants[i][j] == 3 and stages[i][j] == 1:
					set_cell(i+3, j-5, 31)
				elif plants[i][j] == 3 and stages[i][j] == 2:
					set_cell(i+3, j-5, 32)
				elif plants[i][j] == 3 and stages[i][j] < 6:
					set_cell(i+3, j-5, 33)
				elif plants[i][j] == 3 and stages[i][j] >= 6:
					set_cell(i+3, j-5, 34)
				deltas[i][j] += 1
				if deltas[i][j] % 600 == 0:
					stages[i][j] += 1
	

var pressed = false;

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if not pressed:
			var mouse_position = get_global_mouse_position()
			var local_position = to_local(mouse_position)
			var map_position = world_to_map(local_position)
			
			print(map_position)
			
			var this_run = false
			
			if inGarden(map_position):
				print(map_position)
				print("Pass")
				if plants[map_position.x - 5][map_position.y + 3] == -1:
					plant(FollowCursor.get_sel(), map_position)
				else:
					this_run = true
					dig_confirm(map_position)
				print(plants)
			else:
				FollowCursor.visible = false
				FollowCursor.is_visible = false
				FollowCursor.reset_sel()
			
			if not this_run:
				dig_fail()
			pressed = true
		else:
			pressed = false

func inGarden(v):
	if 5 <= v.x and v.x <= 8 and -3 <= v.y and v.y <= 0:
		return true
	else:
		return false

func dig_confirm(v):
	print("Attempted show")
	dig = v
	looking_for_shovel = true
	Shovel.show()
	Shovel.visible = true
	Shovel.is_visible = true

func plant(p, v):
	plants[v.x - 5][v.y + 3] = p
	if p != -1:
		stages[v.x - 5][v.y + 3] = 0
	FollowCursor.reset_sel()

func dig_up(v):
	print(plants)
	print(stages)
	plants[v.x - 5][v.y + 3] = -1
	stages[v.x - 5][v.y + 3] = -1
	print(plants)
	print(stages)
	


func _on_Shovel_pressed():
	shovel_pressed = true
	dig_up(dig)
	dig_fail()


func dig_fail():
	shovel_pressed = false
	looking_for_shovel = false
	Shovel.hide()
	Shovel.visible = false
	Shovel.is_visible = false
