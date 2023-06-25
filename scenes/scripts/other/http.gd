extends Node

#http
var httpreq:HTTPRequest = HTTPRequest.new() #create new node (1)
func _ready():
	add_child(httpreq) #child new node (2)

#Step 3 and 4 removed --> connect signal - display output
#Step 5 and 6 --> projects.gd

#download process
var current_downloading = str('') #prevent multiple - track download
var has_download_started = false
var download_percentage:float = 0.0
func _process(_delta):
	if has_download_started:
		var downloaded_filesize:float = httpreq.get_downloaded_bytes() #get downloaded size (7)
		var total_filesize:float = httpreq.get_body_size() #get file size (8)
		download_percentage = abs((downloaded_filesize / total_filesize) * 100) #get percentage (9)
