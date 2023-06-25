extends Control

#variables
@onready var ui_status = 'main'
@onready var setting = $setting
@onready var main = $main
@onready var projects = $projects

func _process(_delta):
	#display ui
	if ui_status == 'main':
		main.visible = true
		setting.visible = false
		projects.visible = false
	elif ui_status == 'setting': #only access from main
		setting.visible = true
		main.visible = false
	elif ui_status == 'projects': #only access from main
		projects.visible = true
		main.visible = false

#buttons - external
func _on_bt_exit_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().quit()
func _on_bt_github_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			OS.shell_open(GlobalVar.github_link)

#buttons - scenes
func _on_bt_setting_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			ui_status = 'setting'
func _on_bt_projects_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			ui_status = 'projects'
func _on_bt_mainpage_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			ui_status = 'main'
