extends Node

#variables
@onready var signup_ui = $ui_signup
@onready var main_ui = $ui_main

#buttons
func _on_bt_signup_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			main_ui.visible = false
			signup_ui.visible = true
func _on_bt_exit_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().quit()
