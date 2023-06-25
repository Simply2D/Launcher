extends Control

#variables
var username = ''
var gender = ''

#confirmation
func _on_bt_confirm_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if username != '' and username != 'nil' and gender != '':
				DirAccess.make_dir_absolute(GlobalVar.rootfolder)
				_on_req_txt_file()

#main code
func _on_req_txt_file():
	#user info file
	var file = FileAccess.open(GlobalVar.rootfolder + GlobalVar.txtfile_user, FileAccess.WRITE)
	
	#contents - array
	var contents = [username, gender]
	GlobalVar.username = username
	
	#save content to file
	for content in contents:
		file.store_line(content)

#user input
func _on_gender_item_selected(index):
	gender = $gender.get_item_text(index)
func _on_username_mouse_exited():
	username = $username.text
