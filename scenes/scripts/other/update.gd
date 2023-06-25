extends Node

func _process(_delta):
	var file = FileAccess.open(GlobalVar.rootfolder + GlobalVar.txtfile_launchver, FileAccess.READ)
	$current.text = file.get_as_text()
	$update.text = GlobalVar.latest_launchver

func _on_bt_update_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			#change version
			var file = FileAccess.open(GlobalVar.rootfolder + GlobalVar.txtfile_launchver, FileAccess.WRITE)
			file.store_string(GlobalVar.latest_launchver)
			
			#restart
			get_tree().quit()
