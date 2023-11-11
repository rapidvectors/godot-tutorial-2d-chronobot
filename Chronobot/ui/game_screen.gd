extends CanvasLayer

@onready var collectible_label = $MarginContainer/VBoxContainer/HBoxContainer/CollectibleLabel


func _ready():
	CollectibleManager.on_collectible_award_received.connect(on_collectible_award_received)


func on_collectible_award_received(total_award : int):
	collectible_label.text = str(total_award) 


func _on_pause_texture_button_pressed():
	GameManager.pause_game()
