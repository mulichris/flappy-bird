extends CanvasLayer

func _ready():
	$CenterContainer/VBoxContainer/CenterContainer/play.connect("button_up", self, "play_pressed")

func play_pressed():
	get_parent().start_game()
