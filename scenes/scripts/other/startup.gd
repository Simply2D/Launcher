extends Node

#variables
var need_update = false

func _process(_delta):
	#checking...
	print(need_update)
	_check_launcher_version()
	_check_file()
	
#checking point
func _check_file():
	#check file
	var found = FileAccess.file_exists(GlobalVar.rootfolder + GlobalVar.txtfile_user)
	if need_update:
		$update_notice.visible = true
	elif not need_update and not found:
		$new_user.visible = true
	elif not need_update and found:
		$returning_user.visible = true	
func _check_launcher_version():
	#check file
	var found = FileAccess.file_exists(GlobalVar.rootfolder + GlobalVar.txtfile_launchver)
	if not found:
		#create file
		var file = FileAccess.open(GlobalVar.rootfolder + GlobalVar.txtfile_launchver, FileAccess.WRITE)
		
		#store content
		file.store_string('v1.0')
	elif found:
		var file = FileAccess.open(GlobalVar.rootfolder + GlobalVar.txtfile_launchver, FileAccess.READ)
		if file.get_as_text() != GlobalVar.latest_launchver:
			need_update = true
