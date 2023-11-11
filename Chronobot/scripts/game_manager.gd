extends Node

var main_menu_screen = preload("res://ui/main_menu_screen.tscn")
var pause_menu_screen = preload("res://ui/pause_menu_screen.tscn")
var level_1 = preload("res://levels/level_1.tscn")

func _ready():
	RenderingServer.set_default_clear_color(Color(0.44,0.12,0.53,1.00))


func start_game():
	if get_tree().paused:
		continue_game()
		return
	
	transition_to_scene(level_1.resource_path)


func exit_game():
	get_tree().quit()


func pause_game():
	get_tree().paused = true
	
	var pause_menu_screen_instance = pause_menu_screen.instantiate()
	get_tree().get_root().add_child(pause_menu_screen_instance)


func continue_game():
	get_tree().paused = false


func main_menu():
	var main_menu_screen_instance = main_menu_screen.instantiate()
	get_tree().get_root().add_child(main_menu_screen_instance)


func transition_to_scene(scene_path):
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file(scene_path)
