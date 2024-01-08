extends Control

@onready var inventory: Inventory = preload("res://inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


var is_open = false

func update_slots():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])

func _ready():
	print("ready inventory")
	update_slots()
	close()
	
func open():
	visible = true
	is_open = true
	
func _process(delta):
	if Input.is_action_just_pressed("open_inventory"):
		print("toggle inventory")
		if is_open:
			close()
		else:
			open()

func close():
	is_open = false
	visible = false
