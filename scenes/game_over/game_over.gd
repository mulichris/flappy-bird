extends CanvasLayer

func _ready():
	$CenterContainer/VBoxContainer/HBoxContainer/menu.connect("button_up", self, "menu_pressed")

func menu_pressed():
	get_tree().reload_current_scene()
