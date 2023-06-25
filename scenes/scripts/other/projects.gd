extends Node

#variables
var launchpng = preload("res://assets/images/buttons/file/launch.png")
var downloadpng = preload("res://assets/images/buttons/file/download.png")

func _process(_delta):
	#checking...
	_check_folder()
	_check_file()
	_check_download_percentage()

#buttons - project
func _on_calculator_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			#check file
			var found = FileAccess.file_exists(GlobalVar.projectfolder + GlobalVar.exe_calculator)
			if not found and Http.current_downloading == '':
				#Step 1 thru 4 --> http.gd
				Http.httpreq.download_file = GlobalVar.projectfolder + GlobalVar.exe_calculator #setup file detail (5)
				var err = Http.httpreq.request(GlobalVar.ext_calculator) #get file using http (6)
				Http.current_downloading = 'calculator'
				
				if err !=OK:
					print('Error detected!')
				Http.has_download_started = true
func _on_elfilauncher_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			#chek file
			var found = FileAccess.file_exists(GlobalVar.projectfolder + GlobalVar.exe_elfilauncher)
			if not found and Http.current_downloading == '':
				#Step 1 thru 4 --> http.gd
				Http.httpreq.download_file = GlobalVar.projectfolder + GlobalVar.exe_elfilauncher #setup file detail (5)
				var err = Http.httpreq.request(GlobalVar.gith_elfilauncher) #get file using http (6)
				Http.current_downloading = 'elfilauncher'
				
				if err !=OK:
					print('Error detected!')
				Http.has_download_started = true

#checking points
func _check_folder():
	if not FileAccess.file_exists(GlobalVar.projectfolder):
		DirAccess.make_dir_absolute(GlobalVar.projectfolder)
func _check_file():
	for buttons in GlobalVar.exe_array:
		var exe = FileAccess.file_exists(GlobalVar.projectfolder + buttons + '.exe')
		if exe:
			get_node(buttons + '/bt_action/TextureRect').texture = launchpng
func _check_download_percentage():
	if Http.current_downloading != '':
		if Http.download_percentage != 100:
			#texture
			get_node(Http.current_downloading + '/bt_action/TextureRect').texture = downloadpng		
			#progressbar
			get_node(Http.current_downloading + '/thumbnail/ProgressBar').visible = true
			get_node(Http.current_downloading + '/thumbnail/ProgressBar').value = Http.download_percentage
		else:
			#texture - progressbar
			get_node(Http.current_downloading + '/bt_action/TextureRect').texture = launchpng		
			get_node(Http.current_downloading + '/thumbnail/ProgressBar').visible = false
			#change value
			Http.current_downloading = ''

#buttons - external
func _on_bt_mainpage_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().quit()
